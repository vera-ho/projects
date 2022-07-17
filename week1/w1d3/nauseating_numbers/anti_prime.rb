# Write a method anti_prime? that accepts a number as an argument. The method should 
# return true if the given number has more divisors than all positive numbers less than 
# the given number. For example, 24 is an anti-prime because it has more divisors than 
# any positive number less than 24. Math Fact: Numbers that meet this criteria are also 
# known as highly composite numbers.
def anti_prime?(num)
    track = [1, 1] # [number, divisor count] track the highest number with the highest div. count

    # Find divisor count of each number up to num
    # Compare to tracked max value and return result
    (2..num).each do |n|
        count = count_divisors(n)

        if n < num && count > track[1]
            track = [n, count] # save new max 
        elsif n == num && count > track[1] # track[1] holds count(num - 1)
            return true
        end
    end
    false
end

def count_divisors(num)
    count = 0
    (1..num).each { |factor| count += 1 if num % factor == 0 }
    count
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false