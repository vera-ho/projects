# Hold information about player and prompt for pos = [x,y]
class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    # Prompt user for pos = [x, y] 
    # Error handling for invalid input
    # State their mark so they know it's their turn
    def get_pos
        puts "It's your turn, #{@mark}!"
        begin
            puts "Please input a position as 'row col' without quotes."
            usr_input = gets.chomp.split(" ")
            usr_input.each.with_index { |num, i| usr_input[i] = num.to_i }
        rescue ArgumentError => e
            puts "Invalid input. Error: #{e.message}"
            retry
        end
    end
end