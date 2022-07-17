# Write a method at_least? that accepts an array, a number (n), and a block as an
# arguments. The method should return a boolean indicating whether or not at least n
# elements of the array return true when given to the block. Solve this using Array#each.
# def at_least?(arr, n, &prc)
#     count = 0
#     arr.each do |ele| 
#         if prc.call(ele)
#             count += 1
#             if count >= n
#                 return true
#             end
#         end
#     end
#     false
# end

def at_least?(arr, n, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) }
    return true if count >= n 
    false
end

p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }        # false
p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }      # false
p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }    # true
p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') }  # true
p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }      # true
p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }        # false
p at_least?([false, false, false], 3) { |bool| bool }                               # false
p at_least?([false, true, true], 3) { |bool| bool }                                 # false
p at_least?([true, true, true], 3) { |bool| bool }                                  # true
p at_least?([true, true, true, true], 3) { |bool| bool }                            # true