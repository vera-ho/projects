require_relative "./card.rb"

class Board

    def initialize(n=4)
        @board = Array.new(n) { Array.new(n) }
        @length = n
        @array = []
        self.place_cards
    end

    def place_cards
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

    def [](pos)
        row = pos[0]
        col = pos[1]
        @board[row][col]
    end

    def []=(pos, value)
        row = pos[0]
        col = pos[1]
        @board[row][col] = value
    end

    def render
        (0...@length).each do |row|
            (0...@length).each do |col|
                print self[[row, col]].display
            end
            puts
        end
    end

    def won?
        @board.all? do |arr| 
            arr.all? { |card| !card.face_up }
        end
    end

    def reveal(pos)
        self[pos].reveal  #reveal from Card.rb
        self[pos].display
    end



end