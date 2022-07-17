# Write a method rampant_repeats that accepts a string and a hash as arguments. The 
# method should return a new string where characters of the original string are 
# repeated the number of times specified by the hash. If a character does not exist 
# as a key of the hash, then it should remain unchanged.
require "byebug"

def rampant_repeats(str, hash)
    repeated = ""

    str.each_char do |char|
        #debugger
        if hash.has_key?(char)
            repeated += char * hash[char]
        else
            repeated += char
        end
    end
    repeated
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'