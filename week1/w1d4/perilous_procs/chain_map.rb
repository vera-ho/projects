# Write a method that accepts any value and an array of procs as an argument. The method 
# should return the final result of feeding the value through all of the procs. For 
# example, if the array contains three procs, then:
# the value is given to the first proc
# the result of the first proc is given to the second proc
# the result of the second proc is given to the third proc
# the result of third proc is the final resultz
def chain_map(input, arr)
    arr.each { |prc| input = prc.call(input) }
    input
end

add_5 = Proc.new { |n| n + 5 }
half = Proc.new { |n| n / 2.0 }
square = Proc.new { |n| n * n }

p chain_map(25, [add_5, half])          # 15.0
p chain_map(25, [half, add_5])          # 17.5
p chain_map(25, [add_5, half, square])  # 225
p chain_map(4, [square, half])          # 8
p chain_map(4, [half, square])          # 4