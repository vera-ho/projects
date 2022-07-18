require "./board.rb"
require "./human_player.rb"

class Game
    
    def initialize(n, *p_marks)
        @board = Board.new(n)
        @p_marks = p_marks
        @players = @p_marks.map { |mark| HumanPlayer.new(mark) }
        @current = @players[0]
    end

    def switch_turn
        @players = @players.rotate
        @current = @players[0]
    end

    def play
        while @board.empty_pos? 
            @board.print_grid
            @board.place_mark(@current.get_pos, @current.mark)
            if @board.win?(@current.mark)
                puts "#{@current.mark}, you win!"
                @board.print_grid
                return
            else
                switch_turn
            end
        end
        puts "It was a draw!"
    end
end