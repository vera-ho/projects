class GuessingGame
    attr_reader :num_attempts

    def initialize(min, max)
        @min = min
        @max = max
        @num_attempts = 0
        @secret_num = rand(@min..@max)
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if @secret_num == num
            @game_over = true
            puts "you win"
        elsif num > @secret_num
            puts "too big"
        else
            puts "too small"
        end
    end

    def ask_user
        puts "enter a number"
        num = gets.chomp.to_i
        check_num(num)
    end
end
