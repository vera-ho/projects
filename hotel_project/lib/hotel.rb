require_relative "room"

class Hotel
    attr_reader :rooms

    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each { |room_name, capacity| @rooms[room_name] = Room.new(capacity) }
    end

    def name
        new_name = @name.split(" ").map { |word| word[0].upcase + word[1..-1].downcase }
        new_name.join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.any? { |room, capacity| !@rooms[room].full? }
    end

    def list_rooms
        @rooms.each do |room_name, capacity|
            puts "#{room_name}: #{capacity.available_space}"
        end
    end
end
