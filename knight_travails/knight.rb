class KnightPathFinder
    KNIGHT = [  [1, 2] , [1, -2],
                [-1, 2], [-1, -2],
                [2, 1] , [2, -1], 
                [-2, 1], [-2, -1]   ]

    def initialize(start_pos)
        @root = start_pos
        @considered = [start_pos]
        build_move_tree(@root)
    end

    def self.valid_moves(pos)
        # generate all possible moves from position
        valid_moves = []
        KNIGHT.each do |move| # move = [x, y]
            valid_moves << [pos[0] + move[0], pos[1] + move[1]]
        end

        # remove any that are out of bounds on 8x8 grids
        valid_moves.reject do |move|
            move.any? { |pos| pos > 7 || pos < 0 } 
        end
    end

    def new_move_positions(pos)
        # get moves from ::valid_moves
        # check @considered and remove overlap
        moves = KnightPathFinder.valid_moves(pos)
        moves.reject { |move| @considered.include?(move) }
    end

    def build_move_tree(root)

    end
end