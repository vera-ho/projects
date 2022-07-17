# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.
# def coprime?(num1, num2)
#     if num1 == num2
#         # both numbers have divisors of 1 and num1/2
#         return false
#     elsif num1 > num2
#         common(num1, num2)
#     else # num2 > num 1
#         common(num2, num1)
#     end
# end

# def common(larger, smaller)
#     (2..smaller).each do |num|
#         if (larger % num == 0) && (smaller % num == 0)
#             return false # both num1 and num2 share a divisor besides 1
#         end
#     end
#     return true
# end

# cleaner version
def coprime?(num1, num2)
    (2..num1).none? { |divisor| num1 % divisor == 0 && num2 % divisor == 0 }
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false

#p coprime?(5, 5)
#p coprime?(256, 128)
