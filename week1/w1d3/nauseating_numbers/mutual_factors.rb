# Write a method mutual_factors that accepts any amount of numbers as arguments. The 
# method should return an array containing all of the common divisors shared among the 
# arguments. For example, the common divisors of 50 and 30 are [1, 2, 5, 10]. You can 
# assume that all of the arguments are positive integers.
def mutual_factors(*nums)
    # matrix with an array to hold divisors of each num
    divisorArr = Array.new(nums.length){Array.new(0)}

    nums.each.with_index do |num, i|
        divisorArr[i] = divisors(num)
    end
    
    divisorArr = divisorArr.flatten
    (1..divisorArr.max).select do |num|
        num if divisorArr.count(num) == nums.length
    end
end

def divisors(num)
    (1..num).select { |n| n if num % n == 0 }
end


p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]
