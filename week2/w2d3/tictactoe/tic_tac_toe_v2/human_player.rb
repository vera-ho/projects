class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_pos
        puts "It's your turn, #{@mark}!"

        begin
            puts "Please input a position as 'row col' without quotes."
            usr_input = gets.chomp.split(" ")

            if usr_input.length != 2 
                raise ArgumentError.new "Wrong number of inputs."
            elsif usr_input.any? { |ele| alpha?(ele) }
                raise ArgumentError.new "Those are not numbers."
            end
        rescue
            retry
        end

        usr_input.each.with_index { |num, i| usr_input[i] = num.to_i }
        usr_input
    end

    def alpha?(ele)
        alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        ele.each_char { |char| return true if alpha.include?(char) }
        false
    end
end