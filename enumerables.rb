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