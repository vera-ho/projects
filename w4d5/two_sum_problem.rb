# two_sum_problem

# Brute force

def bad_two_sum?(arr, target_sum)                                 #O(n^2)
  arr.each_with_index do |ele1, i1|                               # O(n)
    arr.each_with_index do |ele2, i2|                             # O(n)
      return true if arr[i1] + arr[i2] == target_sum && i1 != i2  #O(1)
    end
  end
  false
end

# Sorting

def okay_two_sum?(arr, target_sum)
  arr = arr.sort                          # O(n log n)
  i = 0                                   # O (1)
  j = arr.length - 1                      # O (1)
  while i < j                             # O (n)
    case arr[i] + arr[j] <=> target_sum   # O (1)
    when 1
      j -= 1                              # O (1)
    when -1
      i += 1                              # O (1)
    when 0
      return true                         # O (1)
    end
  end
  false                                   # O (1)
end


# Hash Map

def two_sum?(arr, target_sum)
  hash = Hash.new(0)
  arr.each_with_index {|ele, i| hash[i] = ele}
  find_number = 0
  hash.values.each_with_index do |num, i|
    find_number = target_sum - num
    return true if hash.has_value?(find_number) && find_number != num
  end
  false
end

arr = [1, 7, 0, 5]

p two_sum?(arr, 6)
p two_sum?(arr, 10)