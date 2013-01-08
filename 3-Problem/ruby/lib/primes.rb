class Primes
  def self.primes
    @@primes ||= [2, 3]
  end

  def self.first(x)
    seed_first(x)
    primes[0...x]
  end

  def self.[] (x)
    seed_first(x)
    primes[x]
  end

  def self.below(x)
    seed_under(x)
    i = primes.length - 1
    i -= 1 while primes[i] > x
    primes[0..i]
  end

  def self.seed_first(x)
    add_next_prime until primes.length > x
  end

  def self.seed_under(x)
    add_next_prime until primes[-1] > x
  end

  def self.add_next_prime
    x = primes[-1] + 2
    x += 2 until is_prime?(x)
    primes << x
    x
  end

  def self.factorization(x)
    factors = []
    i = 0

    while x > 1
      if x % Primes[i] == 0
        x /= Primes[i]
        factors << Primes[i]
      else
        i += 1
      end
    end

    factors
  end

  def self.factors(x)
    factorization(x)
  end

  def self.reduce(fract)
    num_factors = factors(fract[0])
    den_factors = factors(fract[1])
    i = j = 0
    new_num = new_den = 1 
    while num_factors[i] && den_factors[j]
      a = num_factors[i]
      b = den_factors[j]
      if a == b
        i += 1; j += 1
      elsif a > b
        new_den *= b
        j += 1
      else
        new_num *= a
        i += 1
      end
    end

    while i < num_factors.length
      new_num *= num_factors[i]
      i += 1
    end

    while j < den_factors.length
      new_den *= den_factors[j]
      j += 1
    end
    [new_num, new_den]
  end
  
  def self.uniq_factors(x)
    factors = []
    i = 0

    while x > 1
      if x % Primes[i] == 0
        x /= Primes[i]
        factors << Primes[i] unless factors[-1] == Primes[i]
      else
        i += 1
      end
    end

    factors
  end

  def self.is_prime?(x)
    return false if x < 2
    return true if x == 2
    i = 0
    while true
      pr = Primes[i]
      return false if x % pr == 0
      return true if pr * pr > x
      i += 1
    end
  end
end
