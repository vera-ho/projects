require_relative "./card.rb"

class Board
    attr_reader :array

    def initialize(n=4)
        @board = Array.new(n) { Array.new(n) }
        @length = n
        @array = []
    end

    def place_cards(length)
        (length**2 / 2).times do 
            value = ("a".."z").to_a.sample.upcase
            pos = []
            count = 0
            while !@array.include?(pos) && count < 2
                pos = random_pos(length)
                @board[pos[0]][pos[1]] = Card.new(value)
                count += 1
                @array << pos
                pos = []
                # puts "count: #{count} / pos: #{pos} / value: #{value}"
            end
        end

    end

    def random_pos(length)
        num1 = rand(0...length)
        num2 = rand(0...length)
        pos = [num1, num2]
    end 

end