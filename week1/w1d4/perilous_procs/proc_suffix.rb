# Write a method proc_suffix that accepts a sentence and a hash as arguments. The hash
# contains procs as keys and suffix strings as values. The method should return a new
# sentence where each word of the original sentence is appended with a suffix if the
# original word returns true when given to the corresponding proc key. If an original word
# returns true for multiple procs, then the suffixes should be appended in the order that
# they appear in the input hash.
def proc_suffix(sentence, hash)
    words = sentence.split(" ")
    suffixed = []

    words.each do |word|
        temp = word
        hash.each do |key, val|
            if key.call(word)
                temp += hash[key]
            end
        end
        suffixed << temp
    end
    suffixed.join(" ")
end

contains_a = Proc.new { |w| w.include?('a') }
three_letters = Proc.new { |w| w.length == 3 }
four_letters = Proc.new { |w| w.length == 4 }

p proc_suffix('dog cat',
    contains_a => 'ly',
    three_letters => 'o'
)   # "dogo catlyo"

p proc_suffix('dog cat',
    three_letters => 'o',
    contains_a => 'ly'
)   # "dogo catoly"

p proc_suffix('wrong glad cat',
    contains_a => 'ly',
    three_letters => 'o',
    four_letters => 'ing'
)   # "wrong gladlying catlyo"

p proc_suffix('food glad rant dog cat',
    four_letters => 'ing',
    contains_a => 'ly',
    three_letters => 'o'
)   # "fooding gladingly rantingly dogo catlyo"