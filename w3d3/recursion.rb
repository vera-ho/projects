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
    return arr[0] if arr[0].is_a?(Array)
    arr.each do |ele|

    end
end