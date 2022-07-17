def partition(arr, num)
    partitioned = [[],[]]
    partitioned[0] = arr.select { |n| n < num }
    partitioned[1] = arr.select { |n| n >= num } 
    partitioned
end

def merge(hash1, hash2)
    merged = Hash.new()
    hash1.each { |k, v| merged[k] = v }
    hash2.each { |k, v| merged[k] = v }
    merged
end

def censor(sentence, badArr)
    words = sentence.split(" ")
    censored = []
    words.each do |word|
        if badArr.include?(word.downcase)
            str = ""
            word.each_char do |char|  
                if "aeiou".include?(char.downcase)
                    str += "*"
                else
                    str += char
                end
            end
            censored << str
        else
            censored << word
        end
    end

    censored.join(" ")
end

def power_of_two?(num)
    # return true if power of two
    (0..num).each do |n|
        if 2 ** n == num
            return true
        elsif 2 ** n > num
            return false
        end
    end
end

