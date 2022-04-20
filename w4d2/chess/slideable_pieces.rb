require_relative "slideable.rb"
require_relative "piece.rb"

class Rook < Piece
  include Slideable

  def initialize(color, board, pos)
    super
  end

  def symbol
    :R
  end

  # private
  def move_dirs
    moves_horizontal
  end

end

class Bishop < Piece

end

class Queen < Piece


end