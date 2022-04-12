class Card

    def initialize(face_value)
        @face_up = false
        @face_value = face_value
    end

    def hide
        
    end

    def display
        if @face_up
            @face_value
        else
            " " # maybe? maybe take out else?
        end
    end
end