# Write a method first_index that accepts an array and a block as arguments. The method 
# should return the index of the first element of the array that returns true when given
# to the block. If no element of returns true, then the method should return nil. Solve
# this using Array#each.
def first_index(arr, &prc)
    arr.each.with_index { |ele, i| return i if prc.call(ele) }
    nil
end

p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }           # 2
p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 3 } # 0
p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 6 } # nil
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 'b' }            # 0
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.include?('a') }        # 1
p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 't' }            # nil