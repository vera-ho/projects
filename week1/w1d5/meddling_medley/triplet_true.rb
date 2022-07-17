# Write a method triplet_true? that accepts a string as an argument and returns a boolean 
# indicating whether or not the string contains three of the same character consecutively.
def triplet_true(str)
    count = 1
    if str.length < 3
        return false
    end

    str.each_char.with_index do |char, i|
        if char == str[i - 1]
            count += 1
            return true if count > 2 
        elsif char != str[i-1]
            count = 1
        end
    end
    false
end

p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false

def duos(str)
    count = 0
    if str.length < 2
        return 0
    end

    str.each_char.with_index do |char, i|
        if char == str[i - 1]
            count += 1
        end
    end
    count
end