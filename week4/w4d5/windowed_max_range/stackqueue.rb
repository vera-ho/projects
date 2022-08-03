require_relative "mystack.rb"
require_relative "myqueue.rb"

class StackQueue

    def initialize
        @stack1 = MyStack.new
        @stack2 = MyStack.new
    end

    def size
        @stack1.size + @stack2.size
    end

    def empty?(stack)
        stack.empty?
    end

    def enqueue
        @stack1.push(@stack2.pop)
    end

    def dequeue
        @stack2.push(@stack1.pop)
    end

end