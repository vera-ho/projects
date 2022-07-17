# Rewrite your previous filter_out method to mutate the input array instead of returning a
# new array. That is, write a method filter_out! that accepts an array and a block as args.
# The method should remove elements of the input array that return true when given to the
# block. Solve this without using Array.reject!.
def filter_out!(arr, &prc)
    # Rotate array left and shift off any unwanted elements
    # push them back onto the end (on the right) if wanted
    (arr.length).times do
        if prc.call(arr[0])
            arr.shift()
        else 
            ele = arr.shift
            arr.push(ele)
        end
    end
    arr
end

arr_1 = [10, 6, 3, 2, 5 ]
p arr_1.object_id
filter_out!(arr_1) { |x| x.odd? }
p arr_1     # [10, 6, 2]
p arr_1.object_id

puts
arr_2 = [1, 7, 3, 5 ]
p arr_2.object_id
filter_out!(arr_2) { |x| x.odd? }
p arr_2     # []
p arr_2.object_id

puts
arr_3 = [10, 6, 3, 2, 5 ]
p arr_3.object_id
filter_out!(arr_3) { |x| x.even? }
p arr_3     # [3, 5]
p arr_3.object_id

puts
arr_4 = [1, 7, 3, 5 ]
p arr_4.object_id
filter_out!(arr_4) { |x| x.even? }
p arr_4 # [1, 7, 3, 5]
p arr_4.object_id