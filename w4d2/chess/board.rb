require_relative "piece.rb"
require_relative "stepable_pieces.rb"
require_relative "slideable_pieces.rb"

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
    order = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    order.each_with_index { |p, idx| @board[0][idx] = p.new("black", @board, [0, idx]) }
    order.each_with_index { |p, idx| @board[7][idx] = p.new("white", @board, [7, idx]) }

    (0..7).each {|col| @board[1][col] = Pawn.new("black", @board, [1, col]) }
    (0..7).each {|col| @board[6][col] = Pawn.new("white", @board, [6, col]) }
  end

  def valid_move(end_pos)
    end_pos.each{|num| return false if num>7 || num<0}
    true
  end
end
