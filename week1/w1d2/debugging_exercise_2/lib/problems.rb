# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(num)
    largest = 0
    #debugger
    (2..num).each do |factor|
        if num % factor == 0 && isPrime?(factor)
            largest = factor
        end
    end
    largest
end

def isPrime?(num)
    if(num < 2)
        return false
    end

    (2...num).each do |n|
        if(num % n == 0)
            return false
        end
    end
    return true
end

def unique_chars?(str)
    counter = Hash.new(0)
    str.each_char { |char| counter[char] += 1}
    counter.each_value { |val| return false if val > 1 }
    return true
end

def dupe_indices(arr)
    indexCount = Hash.new { |h, k| h[k] = [] }
    arr.each_with_index do |ele, i| 
        if arr.count(ele) > 1
            indexCount[ele] << i
        end
    end
    indexCount
end

def ana_array(arr1, arr2)
    count = Hash.new { |h, k| h[k] = [] }
    if arr1.length != arr2.length
        return false
    else 
        arr1.each do |ele|
            if arr1.count(ele) != arr2.count(ele)
                return false
            end
        end
        return true
    end
end

