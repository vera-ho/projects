# Write a method uncompress that accepts a string as an argument. The string will be 
# formatted so every letter is followed by a number. The method should return an 
# "uncompressed" version of the string where every letter is repeated multiple times
# given based on the number that appears directly after the letter.
def uncompress(str)
    decoded = ""
    str.each_char.with_index { |char, i| decoded += char * str[i + 1].to_i if i % 2 == 0 }
    decoded
end

p uncompress('a2b4c1')    # 'aabbbbc'
p uncompress('b1o2t1')    # 'boot'
p uncompress('x3y1x2z4')  # 'xxxyxxzzzz'