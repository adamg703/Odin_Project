
def caesar_cipher(text, value)
# Splitting up each chracter in the string
  text = text.split(//)
# Mapping thru the array of chracters to get the right letters
  text.map! do |chr|
    if (97..122).include?(chr.ord + value) || (65..90).include?(chr.ord + value)
      chr.ord + value
# When value is added if it isn't a letter make it a letter again by subtracting 26
    elsif (91..96).include?(chr.ord + value) || (123..148).include?(chr.ord + value)
      (chr.ord - 26) + value
    else
      chr
    end
  end
# Pushing the new letters back into a string
  puts "Your new ciphered string is: #{text.inject("", :<<)}"
end
puts "Please input a string that you would like to be Ciphered:"
text = gets.chomp
puts "Please input a number from 1 - 26 that you would like each letter to be shifted to the right in the alphabet:"
value = gets.chomp.to_i
if (1..26).include?(value)
  caesar_cipher(text, value)
else
  puts "Sorry, please run the program again and input a number between 1-26"
end
