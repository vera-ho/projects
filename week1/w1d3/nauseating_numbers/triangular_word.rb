# A triangular number is a number of the form (i * (i + 1)) / 2 where i is some positive
# integer. Substituting i with increasing integers gives the triangular number sequence.
# The first five numbers of the triangular number sequence are 1, 3, 6, 10, 15. Below is
# a breakdown of the calculations used to obtain these numbers:

# i     (i * (i + 1)) / 2
# 1	    1
# 2	    3
# 3	    6
# 4	    10
# 5	    15
# We can encode a word as a number by taking the sum of its letters based on their position in the alphabet. For example, we can encode "cat" as 24 because c is the 3rd of the alphabet, a is the 1st, and t is the 20th:

# 3 + 1 + 20 = 24

# Write a method triangular_word? that accepts a word as an argument and returns a boolean indicating whether or not that word's number encoding is a triangular number. You can assume that the argument contains lowercase letters.
def triangular_word?(word)

end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false