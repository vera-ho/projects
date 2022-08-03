require_relative "board"
require "./human.rb"

class Game
    
    def initialize(n)
        @board = Board.new(n)
        @p1 = Human.new
        @npc1 = Computer.new(n)
        @prev_guess = []
    end

    def play
        until @board.won?
            @board.render
            pos = @p1.get_input
            make_guess(pos)
        end
        puts "Meh."
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
            else
                puts "Good job! You're alright, I guess."
            end
            @prev_guess = []
            puts
        end
    end
end