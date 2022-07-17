def select_even_nums(arr)
    #arr.select { |num| num.even? }
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject { |puppy| puppy["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |array| array.sum > 0 }
end

def aba_translate(word)
    translated = ""
    vowels = "aeiou"

    word.each_char do |char|
        if vowels.include?(char)
            translated += char + "b" + char
        else
            translated += char
        end
    end
    translated
end

def aba_array(words)
    words.map { |word| aba_translate(word) }
end