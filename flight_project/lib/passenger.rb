
# Stores information for one passenger
# One passenger can have multiple flights booked
class Passenger
    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight)
        @flight_numbers.any?(flight.upcase)
    end

    def add_flight(flight)
        if !self.has_flight?(flight)
            @flight_numbers << flight.upcase
        end
    end
end