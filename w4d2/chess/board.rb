require_relative "piece.rb"

class Board
  def initialize
    @board = Array.new(8) { Array.new(8, NullPiece.instance) }
    build_board
  end

  def [](pos)
    @board[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @board[pos[0]][pos[1]] = val
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError.new("No piece at start position") if self[start_pos] == NullPiece.instance
    raise ArgumentError.new("The piece cannot move to end position") if !valid_move(end_pos) 

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
  end

  def build_board
    (0..1).each {|row| (0..7).each {|col| @board[row][col] = Piece.new("white", @board, [row, col]) }}
    (6..7).each {|row| (0..7).each {|col| @board[row][col] = Piece.new("white", @board, [row, col]) }}
  end

  def valid_move(end_pos)
    end_pos.each{|num| return false if num>7 || num<0}
    true
  end
end

# b = Board.new
# b.move_piece([0,0],[2,2])
# p b