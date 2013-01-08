text = File.read(File.dirname( File.expand_path( __FILE__) ) + "/../downloaded/cipher1.txt")

codes = text.split(",").collect(&:to_i)

(97..122).each do |a|
  (97..122).each do |b|
    (97..122).each do |c|
      new_text = ""
      sum = 0
      key = [a, b, c]
      codes.each_with_index do |code, i|
        conv_code = code ^ key[i % 3]
        new_text << conv_code
        sum += conv_code
      end
      puts "key: #{key} sum: #{sum}\n#{new_text}" unless new_text =~ /\{|\}|\=|\%|\$|\#|\@/
    end
  end
end
