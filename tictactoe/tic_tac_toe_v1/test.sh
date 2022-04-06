# !/bin/sh

# chmod 755 to make script executable
# chmod a+rx
# run by typing:
# ./test.sh
# echo "hello world"

# -------------------------------------------- #
# Load files
load "board.rb"

# Initialize new tic tac toe board
b = Board.new
b.print_grid

# Test valid placements
b.place_mark([-1, 2], :X)
b.place_mark([1, 2], :X)
b.place_mark([1, 3], :X)
b.place_mark([0, 0], :O)
b.place_mark([0, 0], :X)

# Show current board
b.print_grid

# Grid should look like this
# [ [:O, "_", "_"], 
#   ["_", "_", :X], 
#   ["_", "_", "_"] ]

# Test wins 
b.place_mark([0, 2], :X)
b.place_mark([2, 2], :X)

# Grid should look like this
# [ [ :O, "_", :X], 
#   ["_", "_", :X], 
#   ["_", "_", :X] ]

b.win?(:X)          # true
b.win?(:O)          # false
b.win_row?(:O)      # false
b.win_row?(:X)      # false
b.win_col?(:X)      # true
b.win_col?(:O)      # false
b.win_diagonal?(:O) # false
b.win_diagonal?(:X) # false

# Add more marks
b.place_mark([1, 0], :O)
b.place_mark([2, 0], :O)

# Grid:
# [ [:O, "_", :X], 
#   [:O, "_", :X], 
#   [:O, "_", :X] ]

b.win?(:X)          # true
b.win?(:O)          # true
b.win_row?(:O)      # false
b.win_row?(:X)      # false
b.win_col?(:X)      # true
b.win_col?(:O)      # true
b.win_diagonal?(:O) # false
b.win_diagonal?(:X) # false

#etc...
