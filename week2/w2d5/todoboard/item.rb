class Item
    attr_reader :title, :deadline, :description

    # valid date format: YYYY-MM-DD
    def self.valid_date?(date)
        date = date.split("-")
        if date[0].length != 4    # multiple if/else only for readability
            return false
        elsif date[1].length != 2 || date[1].to_i < 1 || date[1].to_i > 12
            return false
        elsif date[2].length != 2 || date[2].to_i < 1 || date[2].to_i > 31
            return false
        end
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @description = description

        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise ArgumentError.new "That is not a valid date."
        end
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise ArgumentError.new "That is not a valid date."
        end
    end

    def description=(new_description)
        @description = new_description
    end
end