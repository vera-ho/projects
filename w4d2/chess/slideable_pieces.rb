require_relative "slidable.rb"
require_relative "piece.rb"

class Rook < Piece
  include Slidable
  def initialize(color, board, pos)
    super
  end
  def symbol
    :R
  end

  private
  def move_dirs

  end

end

class Bishop < Piece

end

class Queen < Piece


end