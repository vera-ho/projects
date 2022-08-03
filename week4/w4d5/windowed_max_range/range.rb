
def windowed_max_range(array, size)         # O(n^2)
    current_max_range = 0
    array.each_with_index do |num, i|       # O(n)
        window = array[i...(i + size)]
        max = window.max                    # O(n)
        min = window.min
        if current_max_range < max - min
            current_max_range = max - min
        end
    end
    current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

