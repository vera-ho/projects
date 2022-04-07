# !/bin/sh

# chmod 755 to make script executable
# chmod a+rx
# run by typing:
# ./test.sh
# echo "hello world"

# -------------------------------------------- #
# Load files
load "board.rb"

# Initialize new boards
s = Board.new(4)
l = Board.new(6)

s.print_grid
l.print_grid

# Test Placement Validity
s.valid?([3, 3])
s.valid?([5, 5])
l.valid?([5, 5])
l.valid?([7, 9])

# Test row wins (pick a set)
s.place_mark([2, 0], :X)
s.place_mark([2, 1], :X)
s.place_mark([2, 2], :X)
s.place_mark([2, 3], :X)

s.place_mark([1, 0], :O)
s.place_mark([1, 1], :O)
s.place_mark([1, 2], :O)
s.place_mark([1, 3], :O)

l.place_mark([1, 0], :O)
l.place_mark([1, 1], :O)
l.place_mark([1, 2], :O)
l.place_mark([1, 3], :O)
l.place_mark([1, 4], :O)
l.place_mark([1, 5], :O)

l.place_mark([4, 0], :X)
l.place_mark([4, 1], :X)
l.place_mark([4, 2], :X)
l.place_mark([4, 3], :X)
l.place_mark([4, 4], :X)
l.place_mark([4, 5], :X)

# Test column wins (pick a set)
s.place_mark([0, 0], :X)
s.place_mark([1, 0], :X)
s.place_mark([2, 0], :X)
s.place_mark([3, 0], :X)

s.place_mark([0, 2], :O)
s.place_mark([1, 2], :O)
s.place_mark([2, 2], :O)
s.place_mark([3, 2], :O)

l.place_mark([0, 5], :O)
l.place_mark([1, 5], :O)
l.place_mark([2, 5], :O)
l.place_mark([3, 5], :O)
l.place_mark([4, 5], :O)
l.place_mark([5, 5], :O)

l.place_mark([0, 2], :X)
l.place_mark([1, 2], :X)
l.place_mark([2, 2], :X)
l.place_mark([3, 2], :X)
l.place_mark([4, 2], :X)
l.place_mark([5, 2], :X)

# Test diagonal wins
s.place_mark([0, 0], :X)
s.place_mark([1, 1], :X)
s.place_mark([2, 2], :X)
s.place_mark([3, 3], :X)

# Test empty_pos?
s.place_mark([0, 0], :X)
s.place_mark([0, 1], :X)
s.place_mark([0, 2], :X)
s.place_mark([0, 3], :X)

s.place_mark([1, 0], :X)
s.place_mark([1, 1], :X)
s.place_mark([1, 2], :X)
s.place_mark([1, 3], :X)

s.place_mark([2, 0], :X)
s.place_mark([2, 1], :X)
s.place_mark([2, 2], :X)
s.place_mark([2, 3], :X)

s.place_mark([3, 0], :X)
s.place_mark([3, 1], :X)
s.place_mark([3, 2], :X)
s.place_mark([3, 3], :X)

