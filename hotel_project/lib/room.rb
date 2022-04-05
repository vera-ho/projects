class Room
    attr_reader :capacity, :occupants

    def initialize(num)
        @capacity = num
        @occupants = []
    end

    def full?
        return false if @occupants.length < @capacity
        true
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(guest)
        if !self.full?
            @occupants << guest
            return true
        end
        false
    end
end