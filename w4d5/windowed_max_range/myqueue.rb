class MyQueue

    def initialize
        @store = []
    end

    def enqueue(ele)
        @store.push(ele)
    end

    def dequeue
        @store.shift
    end

    def peek
        @store.first
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end
end