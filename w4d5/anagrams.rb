def first_anagram(str1, str2)   # O(n!)
    possible_anagrams = str1.chars.permutation.to_a # O(n!)
    str_ana = possible_anagrams.map do |ele|        # O(n)
        ele.join                                    # O(1)
    end
    str_ana.include?(str2)                          # O(n)
end

def second_anagram(str1, str2)  # O(n^2) ?
    return false if str1.length != str2.length  # O(1)
    str1.each_char.with_index do |ele, i|       # O(n)
        idx = str2.index(ele)                   # O(1) -> should be O(n) to find index?  
        return false if idx.nil?                # O(1)
        str2.slice!(idx)                        # O(1) ? 
    end
    true
end

def third_anagram(str1, str2)   # O(n log n)
    str1 = str1.chars.sort.join # O(n log n) + O(1)
    str2 = str2.chars.sort.join # O(n log n) + O(1)
    str1 == str2                # O(1)
end

def fourth_anagram(str1, str2)  # O(n)
    ctr1 = Hash.new(0)                          # O(1)
    ctr2 = Hash.new(0)                          # O(1)
    str1.each_char { |char| ctr1[char] += 1 }   # O(n)
    str2.each_char { |char| ctr2[char] += 1 }   # O(n)
    ctr1 == ctr2                                # O(1)
end

def fifth_anagram(str1, str2) # O(n)
    ctr = Hash.new(0)                           # O(1)
    str1.each_char { |char| ctr[char] += 1 }    # O(n)
    str2.each_char { |char| ctr[char] -= 1 }    # O(n)
    ctr.values.all?(0)                          # O(n)
end

p fifth_anagram("gizmo", "sally")    #=> false
p fifth_anagram("elvis", "lives")    #=> true
