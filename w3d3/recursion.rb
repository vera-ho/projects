require 'byebug'

def iterative_range(min, max)
    return [] if max < min
    new_arr = []
    (min...max).each do |num|
            new_arr << num
    end
    return new_arr
end

def recursive_range(min, max)
    return [] if min >= max
    [min] + recursive_range(min + 1, max)
end

def expo_recursion1(b, n)
    return 1 if n==0
    b * expo_recursion1(b, n-1)
end

def expo_recursion2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even?
        even_expo = expo_recursion2(b, n / 2)
        even_expo * even_expo
    else
        odd_expo = expo_recursion2(b, (n-1) / 2)
        b * odd_expo * odd_expo
    end
end

# a = [1, [2], [3, [4]]]
def deep_dup(arr)
    new_arr = []
    arr.each do |ele|
        if ele.is_a?(Array) 
            new_arr << deep_dup(ele)
        else
            new_arr << ele
        end
    end
    return new_arr
end

def it_fib(n)
    fib = [0,1]
    (2..n).each do |i|
        fib << fib[i-1] + fib[i-2]
    end
    return fib
end

def rec_fib(n)
    return [] if n==0
    return [0,1] if n==1
    return [0,1,1] if n==2
    rec_fib(n-1) << rec_fib(n-1)[-1] + rec_fib(n-1)[-2]
end

def bsearch(arr, target)
    return nil if arr.length == 1 && arr[0] != target
    idx = arr.length / 2
    if arr[idx] == target
        return idx
    else
        if arr[idx] < target 
            i = bsearch(arr[idx..-1], target)
            i.is_a?(Integer) ? idx + i : nil
        else # lower half
            bsearch(arr[0..(idx - 1)], target)
        end
    end
end

def merge_sort(arr)
    return arr if arr.length == 1 || arr.length == 0
    half = arr.length / 2
    front_half = merge_sort(arr[0...half]) 
    back_half = merge_sort(arr[half..-1]) 
    merge(front_half, back_half)
end

def merge(arr_1, arr_2)
    # i = 0
    # j = 0
    sorted = []
    # puts "arr1 length: #{arr_1.length}, arr2 length: #{arr_2.length}"
    # debugger
    # while i != arr_1.length && j != arr_2.length
    while sorted.length != (arr_1.length + arr_2.length)
        # if arr_1[i] > arr_2[j]
        if arr_1[0] > arr_2[0]
            sorted << arr_2.shift()
            # sorted << arr_2[j]
            # j += 1
        elsif arr_1[0] < arr_2[0]
            sorted << arr_1.shift()
            # sorted << arr_1[i]
            # i += 1
        end
        # puts "i: #{i}; j: #{j}"
    end
    # print "sorted: #{sorted}"
    # puts
    sorted
end

    