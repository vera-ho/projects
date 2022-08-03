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
        # base -> if item is not array, return self as array element
        return [self] if !self.is_a?(Array)
        arr = []
        self.my_each do |ele|
            if !ele.is_a?(Array)
                arr << ele
            else
                arr += ele.my_flatten
            end
        end
        arr
    end

    def my_zip(*arr)
        new_arr = [] # Array.new(arr.length){Array.new}
        (0...self.length).each do |i|
            subarray = []
            ([self] + arr).each { |a| subarray << a[i] }
            new_arr << subarray
        end
        new_arr
    end

    def my_rotate(n=1)
        (n.abs).times { n > 0 ? self.push(self.shift) : self.unshift(self.pop) }
        self
    end

    def my_join

    end

    def my_reverse

    end
end