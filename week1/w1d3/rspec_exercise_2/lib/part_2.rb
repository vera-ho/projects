def palindrome?(str)
    str.each_char.with_index do |char, i|
        if str[i] != str[-1 - i] && i < (str.length / 2 + 1)
            return false
        end
    end
    true
end

def substrings(str)
    substrings = []
    substr = ""

    str.each_char.with_index do |char, i|
        (i..str.length - 1).each do |j|
            substr += str[j]
            substrings << substr
        end
        substr = ""
    end
    substrings
end

def palindrome_substrings(str)
    substrings(str).select { |string| palindrome?(string) if string.length  > 1 }
end

# r  a  c  e  c  a  r
# 0  1  2  3  4  5  6 
# -7 -6 -5 -4 -3 -2 -1
# neg index = -1 - i