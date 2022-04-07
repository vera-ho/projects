class Board
    attr_reader :grid

    def initialize(n)
        @grid = Array.new(n){Array.new(n, "_")}
    end

    # gets element value at pos = [x, y]
    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    # sets element value
    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    # valid if pos > 0 and pos < max index of grid
    def valid?(pos)
        (pos[0] < 0 || pos[0] > @grid.length || pos[1] < 0 || pos[1] > @grid[1].length) ? false : true
    end

    def empty?(pos)
        self[pos] == "_" ? true : false
    end

    def place_mark(pos, mark)
        unless empty?(pos) && valid?(pos)
            raise ArgumentError.new "That is not a valid position. Game is ending."
        end
        self[pos] = mark
    end

    def print_grid
        @grid.each { |array| puts array.join(" ") }
    end

    def win_row?(mark)
        @grid.each do |row|
            row_count = 0
            row.each { |ele| row_count += 1 if ele == mark }
            return true if row_count == @grid.length
        end
        false
    end

    def win_col?(mark)
        col_count = Array.new(@grid.length, 0)      # [0, 0, 0, ..]
        @grid.each do |row|
            row.each.with_index do |ele, i|
                col_count[i] += 1 if ele == mark
            end
        end
        col_count.any?(@grid.length) ? true : false

    end

    def win_diagonal?(mark)
        diag_count = [0,0]
        (0...@grid.length).each do |i|
            diag_count[0] += 1 if self[[i,i]] == mark
            diag_count[1] += 1 if self[[i, @grid.length - 1 - i]] == mark
        end
        diag_count.any?(@grid.length) ? true : false
    end

    def win?(mark)
        (win_col?(mark) || win_row?(mark) || win_diagonal?(mark)) ? true : false
    end

    def empty_pos?
        @grid.flatten.count("_") > 0
    end
end

