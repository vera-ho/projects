class Game
    
    def initialize(n)
        @board = Board.new(n)
        @prev_guess = []
    end

    def play
        until @board.won?
            @board.render
            guess = gets.chomp.split(" ")
            pos = guess.map { |num| num.to_i }

        end
    end

    def make_guess(pos)
        if @prev_guess.empty?
            @prev_guess = pos
            @board.reveal(pos)
        else
            @board.reveal(pos)
            if @board[pos].display != @board[@prev_guess].displays
                @board.hide(pos)
                @board.hide(@prev_guess)
            end
            @prev_guess = []
        end
    end
end