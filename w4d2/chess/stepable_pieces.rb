require_relative "stepable.rb"
require_relative "piece.rb"
class King < Piece
include Stepable
  def initialize(color, board, pos)
    super
  end

  def symbol
    :♔
  end

  private
  def move_dirs
    KING_MOVES.map {|move| [move[0]+@pos[0], move[1]+@pos[1]] }
  end
end

class Knight < Piece
include Stepable
  def initialize(color, board, pos)
    super
  end
  
  def symbol
    :♘
  end
  private
  def move_dirs
    KNIGHT_MOVES.map {|move| [move[0]+@pos[0], move[1]+@pos[1]] }
  end
end

class Pawn < Piece
  # PAWN_MOVES = [[1, 0]]

  def initialize(color, board, pos)
    super
  end

  def symbol
    :♙
  end

  def move
    move_dirs.select { |move| move.all?{ |index| index <= 7 && index >= 0 } }
  end

  private
  def move_dirs
    all_moves = []
    pos = [@pos[0] + forward_dir, @pos[1]]
    if @board[pos] == NullPiece.instance 
      all_moves << pos
    end

    # add two possible pos if at start row
    pos = [@pos[0] + forward_dir * 2, @pos[1]]
    if at_start_row? && @board[pos] == NullPiece.instance 
      all_moves << pos
    end

    all_moves + side_attacks
  end

  def at_start_row?
    #true if w && row 6 or b && row 1
    (@color == "white" && @pos[0] == 6) || (@color == "black" && @pos[0] == 1) ? true : false
  end

  def forward_dir
    if @color == "white"
      pawn_moves = -1
    else
      pawn_moves = 1
    end
  end

  def side_attacks
    valid_attack = []
    end_pos = [[@pos[0] + forward_dir, @pos[1] + 1], [@pos[0] + forward_dir, @pos[1] - 1]]
    
    end_pos.each do |move|
      if move.all?{ |index| index <= 7 && index >= 0 } &&
            @board[move].color != @color &&
            @board[move].color != nil
        valid_attack << move
      end
    end
    valid_attack
  end
end