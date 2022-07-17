def proper_factors(num)
    (1...num).select { |n| n if num % n == 0 }
end

def aliquot_sum(num)
    proper_factors(num).inject { |sum, n| sum + n }
end

def perfect_number?(num)
    return true if num == aliquot_sum(num)
    false
end

def ideal_numbers(n)
    perfect_count = 0
    ideals = []

    num = 0
    while n != perfect_count
        if perfect_number?(num)
            perfect_count += 1
            ideals << num
        end
        num += 1
    end
    ideals
end