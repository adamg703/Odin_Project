def stock_picker(stocks)
# Empty hash for buy and sell indexes
  buy_sell = []
# Adding each number to their index to find lowest number with lowest index
  stocks.map!.with_index do |num, index|
    num + index
  end
# Finding the lowest num + index & pushing to buy_sell array
  buy = stocks.find_index(stocks.min)
  buy_sell.push(buy)
# Finding the price you should buy at
  buying = stocks.min - buy
# Making the numbers the regular prices again
  stocks.map!.with_index do |num, index|
    num - index
  end
# If the index is lower than the buy index make it zero
  stocks.map!.with_index do |num, index|
    if index < buy
      num = 0
    else
      num = num
    end
  end
# Finding the sell index
  sell = stocks.find_index(stocks.max)
  buy_sell.push(sell)
# Finding the sell price
  selling = stocks.max
# Finding total profit
  profit = selling - buying

puts "If you buy on day #{buy} and sell on day #{sell}, you will make a profit of $#{profit}!"
puts "#{buy_sell}"
end

puts "Please input stock prices for every day with each one seperated by only a comma.  I will tell you what days are the best to buy and sell and also what profit you will make!"
stocks = gets.chomp
stocks = stocks.split(/(\d+)/)
stocks.keep_if do |chr|
  chr =~ /^(\d+)$/
end
stocks.map! do |num|
  num.to_i
end
stock_picker(stocks)
