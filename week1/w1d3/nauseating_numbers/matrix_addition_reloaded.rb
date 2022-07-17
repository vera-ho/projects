# Write a method matrix_addition_reloaded that accepts any number of matrices as arguments.
# The method should return a new matrix representing the sum of the arguments. Matrix 
# addition can only be performed on matrices of similar dimensions, so if all of the given 
# matrices do not have the same "height" and "width", then return nil.
def matrix_addition_reloaded(*matrix_args)
    # matrix[]      in an array of matricies, the length is the number of matricies to be summed
    # matrix[][]    the length of each element in that array is the height of each matrix
    # matrix[][][]  the length of each element in *that new* array is the width of each matrix
    heights = matrix_args.map { |matrix| matrix.length }
    widths = matrix_args.map { |matrix| matrix[0].length }

    sums = Array.new(heights[0]){Array.new(widths[0], 0)}

    # if wrong dimensions, return nil
    return nil if (0...heights.length - 1).any? { |i| heights[i] != heights[i + 1] }
    
    # calculate matrix sums
    matrix_args.inject do |sum, matrix|
        matrix_addition(sum, matrix)
    end
end

# From previous problem
def matrix_addition(matrix1, matrix2)
    h = matrix1.length
    w = matrix1[0].length
    sums = Array.new(h){Array.new(w, 0)}

    (0...h).each do |row|
        (0...w).each do |column|
            sums[row][column] = matrix1[row][column] + matrix2[row][column]
        end
    end
    sums
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil


# [ [[2, 5], [4, 7]] , 
#   [[9, 1], [3, 0]] ]

#   matrix_arg.length = 2
#   matrix_arg[0].length = 2
#   matrix_arg[0][0].length = 2
#   matrix_arg[0][0][0] = 2
#   matrix_arg[0][0][1] = 5
#   matrix_arg[0][1][0] = 4
#   matrix_arg[0][1][1] = 7
#   matrix_arg[1][0][0] = 9
#   matrix_arg[1][0][1] = 1
#   matrix_arg[1][1][0] = 3

# puts matrix_args[0][0][0]
# puts matrix_args[0][0][1]
# puts matrix_args[0][1][0] 
# puts matrix_args[0][1][1] 
# puts matrix_args[1][0][0] 
# puts matrix_args[1][0][1] 
# puts matrix_args[1][1][0] 

# print matrix_args
# puts
# print heights
# puts
# print widths
# puts
# puts "----"

# ------- 

# [    [[2, -5], [7, 10], [0, 1]],
#      [[0, 0],  [12, 4], [6, 3]], 
#      [[-1, 0], [0, -1]]           ]

#   matrix_arg.length = 3
#   matrix_arg[0].length = 3, 3, 2      ## everything here needs to be the same length i.e. 3=3!=2 so dimensions are wrong - cannot be summed
#   matrix_arg[0][0].length = 2, 2, 2   ## here as well
#   don't need to compare matrix[] and matrix [][] lengths