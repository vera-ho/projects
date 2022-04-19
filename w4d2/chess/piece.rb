require "singleton"
class Piece

  def initialize

  end


  def moves

  end
end


class NullPiece < Piece
include Singleton
  def initialize
    super
  end

  def symbol
  end
end