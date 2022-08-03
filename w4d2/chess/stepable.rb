module Stepable

  KING_MOVES = [[0, 1], [1, 0], [0, -1] , [-1, 0], [1, 1], [-1, -1], [-1, 1], [1, -1]]
  KNIGHT_MOVES = [[1, 2] ,[1, -2], [-1, 2], [-1, -2], [2, 1] , [2, -1], [-2, 1], [-2, -1]]

  # takes in current pos and generates new possible positions
  def move_diffs(start_pos)
    raise NoMethodError.new("No move types defined")
  end

  # filtering out invalid positions (out of bounds/occupied by own pieces)
  def move
    move_dirs.select do |end_pos|
      end_pos.all?{ |index| index <= 7 && index >= 0 } &&
      @board[end_pos].color != @color  # check not ours
    end
  end
    
end