module slidable

  HORIZONTAL_DIRS = [[0, 1], [1, 0], [0, -1] , [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [-1, 1], [1, -1]]
 # constant.freeze

  attr_reader :HORIZONTAL_DIRS, :DIAGONAL_DIRS

  # dynamic possible pos based on board state => []
  def moves
    moves = diagonal_dirs + horizontal_dirs
  end

  private
  def horizontal_dirs
    horizontal_moves = []
    (1..7).each do |multiplier| 
      HORIZONTAL_DIRS.each do |move| 
        horizontal_moves << [move[0] * multiplier, move[1] * multiplier] 
      end
    end
    horizontal_moves
  end

  def diagonal_dirs
    diagonal_moves = []
    (1..7).each do |multiplier| 
      DIAGONAL_DIRS.each do |move| 
        diagonal_moves << [move[0] * multiplier, move[1] * multiplier] 
      end
    end
    diagonal_moves
  end

  def move_dirs
    raise NoMethodError.new("No move directions")
  end

end