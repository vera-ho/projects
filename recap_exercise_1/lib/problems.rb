# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    pairs = []
    # iterate through array (nested) and check for all vowels of combined string of each pair
    words.each.with_index do |word, i|
        words[i + 1..-1].each do |comp|
            str = word + " " + comp
            pairs << str if all_vowels?(str)
        end
    end
    pairs
end

def all_vowels?(str)
    vowels = "aeiou"
    found = ""
    vowels.each_char { |char| found += char if str.include?(char) }
    found == vowels     # returns true if pair contains all vowels
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:

# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).any? { |i| num % i == 0 }  
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    bigrams.select { |bg| bg if str.include?(bg) }
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new { |k,v| k == v }
        new_hash = {}
        self.each { |k, v| new_hash[k] = v if prc.call(k,v) }
        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        subs = []
        self.each_char.with_index do |char, i|
            substr = ""
            (i..self.length - 1).each do |j|
                substr += self[j]
                subs << substr
            end
        end

        length ||= self.length
        if length != self.length
            subs = subs.select { |str| str.length == length }
        end
        subs
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alpha = 'abcdefghijklmnopqrstuvwxyz'
        encoded = ""
        self.each_char do |char|
            pos = alpha.index(char.downcase)
            encoded += alpha[(pos + num) % alpha.length]
        end
        encoded
    end
end
