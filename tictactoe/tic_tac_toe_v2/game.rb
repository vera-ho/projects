require "./board.rb"
require "./human_player.rb"

class Game
    
    def initialize(n, p1_mark, p2_mark)
        @board = Board.new(n)
        @p1 = HumanPlayer.new(p1_mark)
        @p2 = HumanPlayer.new(p2_mark)
        @current = @p1
    end

    def switch_turn
        if @current == @p1
            @current = @p2
        else
            @current = @p1
        end
    end

    def play
        while @board.empty_pos?
            @board.print_grid
            @board.place_mark(@current.get_pos, @current.mark)
            if @board.win?(@current.mark)
                puts "#{@current.mark}, you win!"
                return
            else
                switch_turn
            end
        end
        puts "It was a draw!"
    end
end