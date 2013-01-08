require File.dirname( File.expand_path( __FILE__) ) + "/../lib/rj_date.rb"

num_sundays = 0
m, d, y = 1, 1, 1901

until [m, d, y] == [1, 1, 2001]
  num_sundays += 1 if d == 1 && RJDate.day_of_week(m, d, y) == 0
  m, d, y = RJDate.following_day(m, d, y)
end

puts num_sundays
