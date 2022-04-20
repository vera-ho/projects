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

  private
  def move_dirs
    HORIZONTAL_DIRS
  end

  

end

class Bishop < Piece
  include Slideable

  def initialize(color, board, pos)
    super
  end

  def symbol
    :B
  end

  private
  def move_dirs
    DIAGONAL_DIRS
  end
end

class Queen < Piece
  include Slideable

  def initialize(color, board, pos)
    super
  end

  def symbol
    :Q
  end


  private
  def move_dirs
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end

end