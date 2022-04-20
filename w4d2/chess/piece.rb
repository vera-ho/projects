require "singleton"

class Piece
  attr_reader :color
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  #utilize move into check as a helper function?
  def valid_moves
    valid_moves = []
    @board.each_with_index do |row, i|
      (0..7).each { |j| valid_moves << [i, j] if row[j] == NullPiece.instance }
    end
    valid_moves
  end

  def to_s  #come back to this later
    " #{:color} "
  end

  def symbol
    raise ArgumentError.new("No valid Symbol method")
  end

  def empty?
    @board[@pos[0]][@pos[1]] == NullPiece.instance
  end

  def pos=(val)
    @board[@pos[0]][@pos[1]] = val
  end

  # does the move put yourself or opponent into check
  def move_into_check(end_pos) 
    king_pos = []
    @board.each_with_index do |row, i|
      (0..7).each { |j| king_pos = [i, j] if row[j].symbol == :K && row[j].color != @color }
    end
    if king_pos == end_pos
      return true
    end
    false
  end
end



class NullPiece < Piece
  include Singleton

  def initialize
    @color = nil
  end
end