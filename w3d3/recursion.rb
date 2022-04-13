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
    
