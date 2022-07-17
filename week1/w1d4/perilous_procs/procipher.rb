# Write a method procipher that accepts a sentence and a hash as arguments. The hash
# contains procs as both keys and values. The method should return a new sentence where
# each word of the input sentence is changed by a value proc if the original word returns
# true when passed into the key proc. If an original word returns true for multiple key
# procs, then the value proc changes should be applied in the order that they appear
# in the hash.
def procipher(sentence, hash)
    words = sentence.split(" ")
    ciphered = []

    words.each do |word|
        temp = word
        hash.each { |key_prc, val_prc| temp = val_prc.call(temp) if key_prc.call(word) }
        ciphered << temp
    end
    ciphered.join(" ")
end

is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
make_question = Proc.new { |s| s + '???' }
reverse = Proc.new { |s| s.reverse }
add_smile = Proc.new { |s| s + ':)' }

p procipher('he said what!',
    is_yelled => make_question,
    contains_a => reverse
) # "he dias ???!tahw"

p procipher('he said what!',
    contains_a => reverse,
    is_yelled => make_question
) # "he dias !tahw???"

p procipher('he said what!',
    contains_a => reverse,
    is_yelled => add_smile
) # "he dias !tahw:)"

p procipher('stop that taxi now',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "stop that??? taxi??? now"

p procipher('STOP that taxi now!',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "STOP:) that??? taxi??? !won"