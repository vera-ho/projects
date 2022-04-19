module slidable

  HORIZONTAL_DIRS = [[0, 1], [1, 0], [0, -1] , [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [-1, 1], [1, -1]]

  def moves_horizontal
    move(DIAGONAL_DIRS)
  end

  def moves_horizontal
    move(HORIZONTAL_DIRS)
  end
  
  def move(direction_array)
    all_moves = []
    direction_array.each do |direction|
      dx = direction[0]
      dy = direction[1]
      all_moves += grow_unblocked_moves_in_dir(dx, dy)
    end
    all_moves
  end

  private
 
  def grow_unblocked_moves_in_dir(dx, dy)
    original_dx = dx
    original_dy = dy
    unblocked_moves = []
    pos = [@pos[0]+dx][@pos[1]+dy]
    until @board[@pos[0]+dx][@pos[1]+dy] != NullPiece.instance &&
        pos.all?{|index| index<=7 && index>=0}
      unblocked_moves << pos
      dx+=original_dx
      dy+=original_dy
    end
    return unblocked_moves
  end


  def move_dirs
    raise NoMethodError.new("No move directions")
  end

end