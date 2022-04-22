require "byebug"

# my_min ----- phase-1

def my_min_1(arr)
  smallest = arr.first
  arr.each_with_index do |ele1, i1|
    arr.each_with_index do |ele2, i2|
      smallest > ele1 ? smallest = ele1 : smallest
    end
  end
  smallest
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_1(list)  # =>  -5

# my_min ----- phase-2

def my_min_2(arr)
  smallest = arr.first
  arr.each {|ele| smallest = ele if ele < smallest}
  smallest
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_2(list)  # =>  -5

# largest_contiguous_subsum ----- phase-1

def largest_contiguous_subsum1(arr)
  sum = 0
  arr.each_with_index do |ele1, i|
    new_arr = [ele1]
    (i+1...arr.length).each do |j|
      new_arr << arr[j]
      if new_arr.sum > sum
        sum = new_arr.sum
      end
    end
  end
  sum
end

# list = [5, 3, -7]
# p largest_contiguous_subsum1(list) # => 8

# largest_contiguous_subsum ----- phase-2

def largest_contiguous_subsum2(arr)
  largest = 0
  current = 0
  i = 0
  while i < arr.length
    # debugger
    current += arr[i]
    if current > largest
      largest = current
    elsif arr[i].negative?
      current = 0
    end
    i += 1
  end
  largest
end

list = [-7, 10, 5, 3, -7, 8, 3]
p largest_contiguous_subsum2(list)  #18