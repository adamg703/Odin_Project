module Enumerable

  def my_each
    i = 0
    if block_given?
      (self.size).times do
        yield self[i]
        i += 1
      end
      return self
    else
      return self.to_enum(:my_each)
    end
  end

  def my_each_with_index
    i = 0
    if block_given?
      (self.size).times do
        yield self[i], i
        i += 1
      end
      return self
    else
      return self.to_enum(:my_each_with_index)
    end
  end

  def my_select
    i = 0
    if block_given?
      array = []
      (self.size).times do
        if yield self[i]
          array << self[i]
        end
        i += 1
      end
      return array
    else
      return self.to_enum(:my_select)
    end
  end

  def my_all?
    i = 0
    (self.size).times do
      if (yield self[i]) === false
        return false
      else
        i += 1
      end
    end
    return true
  end

  def my_any?
    i = 0
    (self.size).times do
      if yield self[i]
        return true
      else
        i += 1
      end
      return false
    end
  end

  def my_none?
    i = 0
    (self.size).times do
      if yield self[i]
        return false
      else
        i += 1
      end
      return true
    end
  end

  def my_count(item = nil)
    i = 0
    array_count = 0
    if item != nil
      (self.size).times do
        if item === self[i]
          array_count += 1
          i += 1
        else
          i += 1
        end
      end
      return array_count
    elsif block_given?
      (self.size).times do
        if yield self[i]
          array_count += 1
          i += 1
        else
          i += 1
        end
      end
      return array_count
    else
      return self.size
    end
  end

  def my_map(&proc)
    i = 0
    array = []
    if proc
      (self.size).times do
        array << proc.call(self[i])
        i += 1
      end
      return array
    elsif block_given?
      (self.size).times do
        array << (yield self[i])
        i += 1
      end
      return array
    else
      return self.to_enum(:my_map)
    end
  end

  def my_inject(init = nil, sym = nil)
    i = 0
    total = 0
    answer = []
    if init != nil && block_given?
      self.my_each do |num|
        total = (yield init, num)
      end
      return total
    elsif init != nil && sym === nil
      sym = init
      init = self[i]
      (self.size - 1).times do
        init = init.send(sym, self[i + 1])
        i += 1
      end
      return init
    elsif init != nil && sym != nil
      self.my_each do |num|
        init = init.send(sym, num)
      end
      return init
    elsif block_given? && init === nil && sym === nil
      (self.size - 1).times do
        if yield self[i], self[i + 1]
          answer.clear
          answer << self[i]
          i += 1
        end
      end
      return answer
    end
  end
end

def multiply_els(array)
  array.my_inject(:*)
end

array = [1, 2, 3, 4]
proc = Proc.new { |num| num + 10 }
array.my_map(&proc) do |num|
  num - 10
end
