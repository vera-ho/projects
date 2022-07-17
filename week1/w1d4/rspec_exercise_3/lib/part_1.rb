def is_prime?(num)
    return false if num < 2
    (2...num).each { |factor| return false if num % factor == 0 }
    true
end

def nth_prime(n)
    prime_count = 0
    num = 1

    while n != prime_count
        prime_count += 1 if is_prime?(num)
        num += 1
    end
    (num - 1)
end

def prime_range(min, max)
    (min..max).select { |num| is_prime?(num) }
end