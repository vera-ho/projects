class Board

    def initialize(n=4)
        @board = Array.new(n) { Array.new( n, Card.new() ) }
        @length = n
    end

    def place_cards(length)
        
        (n**2 / 2).times do 
            value = ("a".."z").upcase.to_a.sample
            
        end

    end



end