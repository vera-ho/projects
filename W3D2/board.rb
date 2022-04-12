class Board

    def initialize(n=4)
        @board = Array.new(n) { Array.new( n, Card.new() ) }
        @length = n
        @array = []
    end

    def place_cards(length)
        (length**2 / 2).times do 
            value = ("a".."z").upcase.to_a.sample
            pos = []
            count = 0
            while !@array.include?(pos) && count < 2
                pos = random_pos(length)
                @board[pos[0]][pos[1]] = value
                count += 1
            end
        end

    end

    def random_pos(length)
        num1 = rand(0...length)
        num2 = rand(0...length)
        pos = [num1, num2]
    end

    

end