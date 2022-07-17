# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
def compress_str(str)
    arr = str.split("")
    compressed = []
    prev_char = arr[0]
    count = 0

    arr.each do |char|
        if char != prev_char
            update_arr(compressed, count, prev_char)
            prev_char = char #set new previous
            count = 1
        else # duplicate char
            count += 1
        end
    end

    update_arr(compressed, count, prev_char)
    return compressed.join("")
end

def update_arr(compressed, count, char)
    if count > 1
        compressed << count
    end
    compressed << char
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
