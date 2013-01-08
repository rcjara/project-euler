class PokerHand
  attr_reader :flush, :straight, :significant_highs, :other_highs, :rank

  POKER_RANKS = {
    high_card: 0,
    pair: 1,
    two_pair: 2,
    three_of_a_kind: 3,
    straight: 4,
    flush: 5,
    full_house: 6,
    four_of_a_kind: 7,
    straight_flush: 8
  }

  def initialize(array_of_cards)
    split_array(array_of_cards)
    @flush = detect_flush
    @straight = detect_straight
    @rank = assign_rank
  end

  def split_array(array_of_cards)
    @suits = array_of_cards.collect{ |c| c[-1] }
    @cards = array_of_cards.collect{ |c| card_rank(c[0...-1]) }.sort
  end

  def detect_flush
    first = @suits[0]
    @suits[1..-1].each{ |s| return false unless s == first }
    true
  end

  def detect_straight
    prev = @cards[0]
    @cards[1..-1].each do |c| 
      return false unless c == prev + 1
      prev = c
    end
    true
  end

  def assign_rank
    if straight || flush
      @significant_highs = @cards.reverse
      @other_highs = [-1]
      if straight && flush
        return 8
      elsif straight
        return 4
      else
        return 5
      end
    end

    prev = @cards[0]
    run = [@cards[0] ]
    runs = []
    @cards[1..-1].each do |c|
      if c == prev
        run << c
      else
        runs << run if run.length > 1
        run = [c]
      end
      prev = c
    end
    runs << run if run.length > 1

    runs.sort!{ |a, b| b.length <=> a.length }
    @significant_highs = runs.collect{|r| r[0] }
    @other_highs = @cards.reverse + [-1]
    runs.each{ |r| @other_highs -= r }

    return 0 if runs.empty?

    if runs.length > 1
      if runs[0].length == 3
        return 6
      else
        return 2
      end
    else
      if runs[0].length == 4
        return 7
      elsif runs[0].length == 3
        return 3
      else
        return 1
      end
    end
  end

  def <=>(other)
    if rank > other.rank
      return 1
    elsif rank < other.rank
      return -1
    end

    @significant_highs.each_with_index do |sh, i| 
      if sh > other.significant_highs[i]
        return 1
      elsif sh < other.significant_highs[i]
        return -1
      end
    end
    
    @other_highs.each_with_index do |oh, i| 
      if oh > other.other_highs[i]
        return 1
      elsif oh < other.other_highs[i]
        return -1
      end
    end

    0
  end

  def >(other)
    (self <=> other) == 1
  end

  def <(other)
    (self <=> other) == -1
  end

  def card_rank(string)
    card_rank_hash[string]
  end

  def card_rank_hash
    @@card_rank_hash ||= construct_card_rank_hash
  end

  def construct_card_rank_hash
    array = (2..9).collect(&:to_s) + ['T','J','Q','K','A']
    hash = {}
    array.each_with_index do |s, i|
      hash[s] = i
    end

    hash
  end
end
