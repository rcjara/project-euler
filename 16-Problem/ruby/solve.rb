string = (2 ** 1000).to_s
puts string.each_char.inject(0) {|sum, ch| ch.to_i + sum }
