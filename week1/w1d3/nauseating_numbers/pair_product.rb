# Write a method pair_product that accepts an array of numbers and a product as arguments. 
# The method should return a boolean indicating whether or not a pair of distinct 
# elements in the array result in the product when multiplied together. You may assume 
# that the input array contains unique elements.

# def pair_product(nums, product)
#     nums.each.with_index do |num, i|
#         ((i + 1)..nums.length - 1).each do |n|
#             if num * nums[n] == product
#                 return true
#             end
#         end
#     end
#     false
# end

def pair_product(nums, product)
    (0...nums.length - 1).any? do |i|
        ((i + 1)..nums.length - 1).any? { |n| nums[i] * nums[n] == product }
    end
end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false