class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        arr = []
        i = 0
        while i < self.length
            arr.push(self[i]) if prc.call(self[i])
            i += 1
        end
        arr
    end

    def my_reject
        
    end

    def my_any?

    end

    def my_all?

    end

    def my_flatten

    end

    def my_zip

    end

    def my_rotate

    end

    def my_join

    end

    def my_reverse

    end
end