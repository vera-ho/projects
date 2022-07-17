# Write a method squaragonal? that accepts 2-dimensional array as an argument. The method
# should return a boolean indicating whether or not the array contains all of the same
# element across either of its diagonals. You may assume that the 2-dimensional array has
# "square" dimensions, meaning it's height is the same as it's width.
def squaragonal?(arr2D)
    
end

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

# true
# true
# true 
# false