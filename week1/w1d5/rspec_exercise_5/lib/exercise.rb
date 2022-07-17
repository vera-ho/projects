def zip(*arr_args)
    # arr_arg[].length  is the 'height' of zipped -> row
    # arr_arg.length    is the 'width' of zipped  -> col
    zipped = Array.new(arr_args[0].length) { Array.new(arr_args.length, 0) }
    arr_args.each.with_index do |array, col|
        array.each.with_index do |ele, row|
            zipped[row][col] = ele
        end
    end
    zipped
end

def prizz_proc(arr, prc1, prc2)
    arr.select { |ele| (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele)) }
end

def zany_zip(*arr_args)
    # Array.new(height) { Array.new(width, init_val)}
    # need length of longest input array for height of zipped
    h = (arr_args.map { |array| array.length }).max
    w = arr_args.length
    zipped = Array.new(h) { Array.new(w, nil) }

    arr_args.each.with_index do |array, col|
        array.each.with_index do |ele, row|
            zipped[row][col] = ele
        end
    end
    zipped
end

def maximum(arr, &prc)
    max_index = 0
    arr.each.with_index { |ele, i| max_index = i if prc.call(ele) > prc.call(arr[i - 1])}
    arr[max_index]
end

# keys - prc.call(ele)
# vals - array of all ele that got key
def my_group_by(arr, &prc)
    hash = Hash.new { |h, k| h[k] = [] }
    arr.each { |ele| hash[prc.call(ele)] << (ele) }
    hash
end

def max_tie_breaker(arr, prc1, &prc2)
    max_index = 0
    arr.each.with_index do |ele, i|
        # new if max (blk) OR tie-break (prc > blk), otherwise keep same max
        if prc2.call(ele) > prc2.call(arr[max_index]) || (prc2.call(ele) == arr[max_index] && prc1.call(ele) > prc2.call(ele))
            max_index = i
        end
    end
    arr[max_index]
end

def silly_syllables(sentence)
    words = sentence.split(" ")
    silly = []
    v1_idx = 0
    v2_idx = 0

    words.each do |word|
        if vowel_count(word) < 2
            silly << word
        else
            silly << word[first_vowel(word)..last_vowel(word)]
        end
    end
    silly.join(" ")
end

# Helper methods for silly_syllables
def vowel_count(word)
    count = 0
    vowels = "aeiou"
    word.each_char { |char| count += 1 if vowels.include?(char.downcase)}
    count
end

def first_vowel(word)
    vowels = "aeiou"
    word.each_char.with_index { |char, i| return i if vowels.include?(char) }
end

def last_vowel(word)
    (-1 - first_vowel(word.reverse))
end

#  c  o  n  t  a  i  n
#  0  1  2  3  4  5  6
# -7 -6 -5 -4 -3 -2 -1

#  n  i  a  t  n  o  c
#  0  1  2  3  4  5  6

# contain
# o index 1
# i rev_index 1 -> need 5
#               -> i + 1 spaces from the end
#               -> -1 - i

# a rev_index 2 => actual index is -1 - (2) = -3

