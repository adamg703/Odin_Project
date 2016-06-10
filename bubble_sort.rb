def bubble_sort(array)
  (array.length - 1).times do
    array.each.with_index do |num, index|
      if index > array.length - 2
        num
      elsif (num <=> array[index + 1]) === 1
        array[index], array[index + 1] = array[index + 1], array[index]
      else
        num
      end
    end
  end
  puts array
end

bubble_sort([4, 3, 78, 2, 0, 2])


def bubble_sort_by(array)
  i = 0
  (array.length - 1).times do
    if (yield array[i], array[i + 1]) > 0
      array[i], array[i + 1] = array[i + 1], array[i]
    end
    i += 1
  end
  puts array
end

bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
  right.length - left.length
end
