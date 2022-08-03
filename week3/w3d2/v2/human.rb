class Human

    def initialize
        # ?
    end

    def prompt
        puts 'Please enter a valid position. :)'
    end

    def get_input
        self.prompt
        guess = gets.chomp.split(" ")
        guess.map { |num| num.to_i }
    end
end