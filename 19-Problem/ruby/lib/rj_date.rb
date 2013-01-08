class RJDate
  MONTHS_DAYS = [31, 30, :leap, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def self.day_of_week(month, day, year)
    (1 + days_up_to_month(month - 1, year) + (day - 1) + days_up_to_year(year)) % 7
  end

  def self.following_day(month, day, year)
    m = month - 1
    d = day - 1
    y = year

    d += 1
    d %= days_in_month(m, year)
    if d == 0
      m += 1
      m %= 12
      if m == 0
        y += 1
      end
    end
    [m + 1, d + 1, y]
  end

  def self.days_up_to_month(month, year)
    (0...month).inject(0){|s, mon| s + days_in_month(mon, year) }
  end

  def self.days_in_month(month, year)
    MONTHS_DAYS[month] == :leap ? leap(year) : MONTHS_DAYS[month]
  end

  def self.days_up_to_year(year)
    (1900...year).inject(0){|s, yr| s + days_in_year(yr) }
  end

  def self.days_in_year(year)
    leap(year) == 29 ? 366 : 365
  end

  def self.leap(year)
    28 + if year % 4 == 0
      if year % 100 == 0
        year % 400 == 0 ? 1 : 0
      else
        1
      end
    else
      0
    end
  end
end
