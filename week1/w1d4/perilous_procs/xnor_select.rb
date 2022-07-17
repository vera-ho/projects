# Write a method xnor_select that accepts an array and two procs as arguments. The method
# should return a new array containing elements of the original array that either return
# true for both procs or return false for both procs.
def xnor_select(arr, prc1, prc2)
    xnor = []
    arr.each { |ele| xnor << ele if (prc1.call(ele) == prc2.call(ele)) } 
    xnor
end

# def xnor_select(arr, prc1, prc2)
#     arr.select { |ele| ele if (prc1.call(ele) == prc2.call(ele)) } 
# end

#      XOR  XNOR
# 0 0   0   1
# 0 1   1   0
# 1 0   1   0
# 1 1   0   1

is_even = Proc.new { |n| n % 2 == 0 }
is_odd = Proc.new { |n| n % 2 != 0 }
is_positive = Proc.new { |n| n > 0 }

p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5