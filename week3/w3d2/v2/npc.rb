class Computer
    attr_reader :length

    def initialize(n)
        @npc_pos = []
        @length = n
        @known = Hash.new{ |h,k| h[k] = [] }  # k = card value; v = position
        @keys = []
        @guess_num = 0
        @prev_guess = []
    end

    def make_guess
        if @guess_num % 2 == 0
            @keys = @known.keys
            @keys.shuffle.each do |k|
                if @known[k].length > 1
                    return @prev_guess = @known[k].sample
                else
                    return @prev_guess = [rand(length), rand(length)]
                end
            end
        else # second guess
            @known.each do |k, pos_arr|
                if pos_arr.include?(@prev_guess)
                    pos_arr.each { |pos| return pos if pos != @prev_guess }
                    @known[k] = []
                end
            @prev_guess = []
        end
        @guess += 1
    end
end