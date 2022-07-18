class Player
    def get_move
        p "enter a position with coordinates separated by a space like '4 7'"
        input = gets.chomp.split(" ")
        input.each.with_index do |num, i|
            input[i] = num.to_i
        end
        input
    end
end
