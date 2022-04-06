class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p "you sunk my battleship!"
            true
        else
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        n = @grid.length
        while self.num_ships < @size/4
            pos = [rand(n), rand(n)]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        n = @grid.length
        hidden = Array.new(n){Array.new(n, :N)}
        (0...n).each do |row|
            (0...n).each do |col|
                pos = [row, col]
                if self[pos] == :X
                    hidden[row][col] = :X
                end
            end
        end
        hidden
    end

    def self.print_grid(matrix)
        matrix.each do |array| 
            puts array.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
