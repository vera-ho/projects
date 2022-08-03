# two_sum_problem

# Brute force
# Iterate through every element 
def bad_two_sum?(arr, target_sum)                                 #O(n^2)
  arr.each_with_index do |ele1, i1|                               # O(n)
    arr.each_with_index do |ele2, i2|                             # O(n)
      return true if arr[i1] + arr[i2] == target_sum && i1 != i2  # O(1)
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
# Iterate through array once
# Subtract ele from target and look for the resulting diff in hash
# If not in hash, add to hash
def two_sum?(arr, target_sum)             # O(n)
  hash = Hash.new(0)                      # O(1)
  arr.each do |ele|                       # O(n)
    diff = target_sum - ele               # O(1)
    if hash.has_key?(diff)                # O(1)
      return true 
    else
      hash[ele] += 1                      # O(1)
    end
  end
  false
end

arr = [1, 7, 5, 0, 5]

p two_sum?(arr, 6)
p two_sum?(arr, 10)