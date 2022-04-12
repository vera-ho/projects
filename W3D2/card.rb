class Card
        attr_reader :face_up
        
    def initialize(face_value)
        # @face_up = true #for testing only
        @face_up = false 
        @face_value = face_value
    end

    def display
        if @face_up
            @face_value
        else
            " " # maybe? maybe take out else?
        end
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end
end