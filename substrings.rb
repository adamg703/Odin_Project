def substrings(string, dictionary)
  matches = {}
# Splitting the dictionary into seperate words
  dictionary = dictionary.split(/\W+/)
# Making every dictionary words downcase
  dictionary.map! do |word|
    word.downcase
  end
# Making the string downcase
  string = string.downcase
# Searching the dictionary for any matches and incrementing based on how many times its found
  dictionary.each do |word|
    if string.include?(word)
      matches[word] = 0 + string.scan(word).count
    end
  end
  puts "These are the words from your dictionary that appeared in your string and how many times they did: #{matches}"
end

puts "Please input some words that you would like to be included in your dictionary:"
dictionary = gets.chomp

puts "Awesome! Here are the words included in your dictionary: #{dictionary.split(/\W+/)}"

puts "Next please input a string to find out how many times each word in your dictionary appears in your string"
string = gets.chomp

substrings(string, dictionary)
