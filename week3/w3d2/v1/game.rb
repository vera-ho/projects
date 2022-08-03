require_relative "board"

class Game
    
    def initialize(n)
        @board = Board.new(n)
        @prev_guess = []
    end

    def play
        until @board.won?
            @board.render
            puts 'Please enter a valid position. :)'
            guess = gets.chomp.split(" ")
            pos = guess.map { |num| num.to_i }
            make_guess(pos)
        end
    end

    def make_guess(pos)
        if @prev_guess.empty?
            @prev_guess = pos
            @board.reveal(pos)
        else
            @board.reveal(pos)
            @board.render
            if @board[pos].display != @board[@prev_guess].display
                @board[pos].hide
                @board[@prev_guess].hide
                puts 'No match! You suck at this game.'
            end
            @prev_guess = []
            puts
        end
    end
end