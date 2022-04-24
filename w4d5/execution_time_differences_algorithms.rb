require "byebug"

# my_min ----- phase-1
def my_min_1(arr)             # O(n^2)
  smallest = arr.first                                # O(1)
  arr.each_with_index do |ele1, i1|                   # O(n)
    arr.each_with_index do |ele2, i2|                 # O(n)
      smallest > ele1 ? smallest = ele1 : smallest    # O(1)
    end
  end
  smallest
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_1(list)  # =>  -5

# my_min ----- phase-2
def my_min_2(arr)             # O(n)
  smallest = arr.first                                # O(1)
  arr.each {|ele| smallest = ele if ele < smallest}   # O(n)
  smallest
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_2(list)  # =>  -5

# largest_contiguous_subsum ----- phase-1
def largest_contiguous_subsum1(arr)   # O(n^3)
  sum = 0                             # O(1)
  arr.each_with_index do |ele1, i|    # O(n)
    new_arr = [ele1]                  # O(1)
    (i+1...arr.length).each do |j|    # O(n)
      new_arr << arr[j]               # O(1)
      if new_arr.sum > sum            # O(1)
        sum = new_arr.sum             # O(n)
      end
    end
  end
  sum
end

# list = [5, 3, -7]
# p largest_contiguous_subsum1(list) # => 8

# largest_contiguous_subsum ----- phase-2
# Given arr of integers, find the largest sub-sum of continguous numbers
# Track largest sum and current sum; reset current sum if a negative number is found
# Compare current and largest; set largest when current > largest
# Loops through array only once
def largest_contiguous_subsum2(arr)   # O(n)
  largest = 0
  current = 0
  i = 0                   # O(1)
  while i < arr.length    # O(n)
    # debugger
    current += arr[i]     # O(1)
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