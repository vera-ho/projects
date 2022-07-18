require './list.rb'

# Takes user input
# Performs actions on List - v1 only manages one list
class Board

    def initialize(label)
        @list = List.new(label)
    end

    # assumes usr input is correctly formatted
    def get_command
        print "Enter a command:"
        cmd, *args = gets.chomp.split(" ")

        print "args: #{args}"
        puts

        case cmd.downcase
        when "mktodo"
            @list.add_item(args[0], args[1], args[2])
            # @list.print     # for testing
        when "up"
            @list.up(args[0].to_i, (args[1].to_i if args[1]))
            # @list.print     # for testing
        when "down"
            @list.down(args[0].to_i, (args[1].to_i if args[1]))
            # @list.print     # for testing
        when "swap"
            @list.swap(args[0].to_i, args[1].to_i)
            # @list.print     # for testing
        when "sort"
            @list.sort_by_date!
            # @list.print     # for testing
        when "priority"
            @list.print_priority
        when "print"
            if args.length == 0
                @list.print
            else
                @list.print_full_item(args[0].to_i)
            end
        when "quit"
            return false
        else
            puts "Not a valid command."
        end
        true
    end

    def run
        puts
        puts "Make a to do item: \"mktodo <title> <deadline> <description (optional)>\""
        puts "Move item up:      \"up <index> <optional amount>\""
        puts "Move item down:    \"down <index> <optional amount>\""
        puts "Swap items:        \"swap <item #> <item #>\""
        puts "Sort by date:      \"sort\""
        puts "Show top priority: \"priority\""
        puts "Show all items:    \"print <optional index>\""
        puts "Quit:              \"quit\""
        puts

        while get_command
        end
    end
end