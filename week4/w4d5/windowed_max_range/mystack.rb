class MyStack

    def initialize
        @store = []
    end

    def push(ele)
        @store.unshift(ele)
    end

    def pop
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