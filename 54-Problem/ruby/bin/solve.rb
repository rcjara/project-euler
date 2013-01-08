require File.dirname( File.expand_path( __FILE__) ) + "/../lib/poker_hand.rb"

double_hands = File.read(File.dirname( File.expand_path( __FILE__) ) + "/../../downloaded/poker.txt").split(/\n/)

ans = 0
double_hands.each.with_index do |line, i|
  begin
    cards = line.split(" ")
    hand1 = PokerHand.new cards[0..4]
    hand2 = PokerHand.new cards[5..9]
    ans += 1 if hand1 > hand2
  rescue Exception => e
    puts "#{i + 1}: #{line}"
    throw e 
  end
end

puts ans


