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

    def my_reject(&prc)
        arr = []
        i = 0
        while i < self.length
            arr<< self[i] if !prc.call(self[i])
            i += 1
        end
        arr
    end

    def my_any?(&prc)
        i = 0
        while i < self.length
            return true if prc.call(self[i])
            i += 1
        end
        false
    end

    def my_all?(&prc)
        self.my_each{|element|return false if !prc.call(element)}
        true
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