class PythTrip
  def self.is_trip?(a, b, c)
    return false unless b > a && c > b
    dif(a, b, c) == 0
  end

  def self.find_rest(c)
    (1..(c - 2) ).each do |a|
      b = given_a_c(a, c)
      return [a, b] if b
    end
    [nil, nil]
  end

  def self.find_third(c, a)
    if (a ** 2) * 2 > c ** 2
      b = a
      given_b_c(b, c)
    else
      given_a_c(a, c)
    end
  end

  def self.dif(a, b, c)
    c ** 2 - (a ** 2 + b ** 2)
  end

  def self.given_a_c(a, c)
    b = a + 1

    the_dif = dif(a, b, c)
    while the_dif > 0
      the_dif -= 2 * b + 1
      b += 1
    end
    
    return b if the_dif == 0
    nil
  end

  def self.given_b_c(b, c)
    a = b - 1
    the_dif = dif(a, b, c)
    while the_dif < 0
      a -= 1
      the_dif += 2 * a + 1
    end
    
    return a if the_dif == 0
    nil
  end
end
