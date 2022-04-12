require_relative "./card.rb"

class Board
    # attr_reader :array

    def initialize(n=4)
        @board = Array.new(n) { Array.new(n) }
        @length = n
        @array = []
    end

    def place_cards()
        until @array.length == (@length**2)/2
            value = ("a".."z").to_a.sample.upcase
            @array << value
        end
        @array = (@array * 2).shuffle
        (0...@length).each do |row|
            (0...@length).each do |col|
                @board[row][col] = Card.new(@array.shift())
            end
        end
    end

end