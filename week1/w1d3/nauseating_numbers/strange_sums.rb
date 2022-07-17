# Write a method strange_sums that accepts an array of numbers as an argument. 
# The method should return a count of the number of distinct pairs of elements 
# that have a sum of zero. You may assume that the input array contains 
# unique elements.
def strange_sums(nums)
    count = 0

    nums.each.with_index do |num, i|
        ((i + 1)..nums.length - 1).each do |n|
            if num + nums[n] == 0
                count += 1
            end
        end
    end
    count
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0
p strange_sums([-9])                  # 0 
p strange_sums([-1, 0, 1, 2, 1, -1])  # 4