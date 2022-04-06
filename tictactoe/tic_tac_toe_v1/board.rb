# Notes
# @grid - 2D array of 3x3
# marks - unique symbols players use to play
#   empty position denoted by "_"
#   players are :X or :O
# Example of grid:
#   [
#     [:X, :O, '_'],
#     [:O, :X, '_'],
#     ['_', '_', :X],
#   ]
# pos - [x, y]

class Board
    # attr_reader :grid

    def initialize
        @grid = Array.new(3){Array.new(3, "_")}
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end

    # pos = [row, col]
    def valid?(pos)
        # return false if pos[0] > @grid.length || pos[1] > @grid[0].length
        if pos[0] < 0 || pos[0] > @grid.length || pos[1] < 0 || pos[1] > @grid[1].length
            return false
        end
        true
    end

    def empty?(pos)
        return true if self[pos] == "_"
        false
    end

    def place_mark(pos, mark)
        unless empty?(pos) && valid?(pos)
            raise ArgumentError.new "That is not a valid position."
        end

        # @grid[pos[0]][pos[1]] = mark
        self[pos] = mark
    end

    def print_grid
        @grid.each do |array|
            puts array.join(" ")
        end
    end
end

