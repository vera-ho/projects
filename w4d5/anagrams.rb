def first_anagram(str1, str2)
    possible_anagrams = str1.chars.permutation.to_a # O(n!)
    str_ana = possible_anagrams.map do |ele|        # O(n)
        ele.join                                    # O(1)
    end
    str_ana.include?(str2)                          # O(n)
end



def second_anagram(str1, str2)
    return false if str1.length != str2.length  # O(1)
    str1.each_char.with_index do |ele, i|       # O(n)
        idx = str2.index(ele)                   # O(1)   
        return false if idx.nil?                # O(1)
        str2.slice!(idx)                        # O(1) ? 
    end
    true
end

def third_anagram(str1, str2)
    str1 = str1.chars.sort.join # O(n log n) + O(1)
    str2 = str2.chars.sort.join # O(n log n) + O(1)
    str1 == str2                # O(1)
end

def fourth_anagram(str1, str2)
    ctr1 = Hash.new(0)
    ctr2 = Hash.new(0)
    str1.each_char { |char| ctr1[char] += 1 }
    str2.each_char { |char| ctr2[char] += 1 }
    ctr1 == ctr2
end

def fifth_anagram(str1, str2)
    ctr = Hash.new(0)
    str1.each_char { |char| ctr[char] += 1 }
    str2.each_char { |char| ctr[char] -= 1 }
    ctr.values.all?(0)
end

p fifth_anagram("gizmo", "sally")    #=> false
p fifth_anagram("elvis", "lives")    #=> true
