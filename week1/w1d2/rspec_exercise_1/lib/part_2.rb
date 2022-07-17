def hipsterfy(word)
    vowels = "aeiou"
    arr = word.reverse.split("")
    str = ""
    removed = false

    if arr.none? { |char| vowels.include?(char) }
        return word # no vowels, just return the word as-is
    else
        arr.each_with_index do |char, i| 
            if !removed && vowels.include?(char)
                arr[i] = ""
                removed = true
            end
        end
        arr.join("").reverse
    end
end

def vowel_counts(str)
    vowels = Hash.new(0) # initialize?
    str.downcase.each_char { |char| vowels[char] += 1 }
    vowels
end

def caesar_cipher(str, n)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    arr = str.split("")

    arr.each_with_index do |char, i|
        if alpha.include?(char) # do not modify non-alpha char
            arr[i] = alpha[(alpha.index(char) + n) % alpha.length]
        end
    end

    arr.join("")
end
