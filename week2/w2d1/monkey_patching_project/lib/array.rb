# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        if self.length > 0
            self.max - self.min
        else
            nil
        end
    end

    def average
        if self.length > 0
            (self.sum + 0.0) / self.length
        else
            nil
        end
    end

    def median
        temp = self.sort
        if self.length == 0
            nil
        elsif self.length % 2 == 1
            temp[self.length/2]
        else #self.length % 2 == 0
            (temp[self.length/2] + temp[self.length/2 - 1])/2.0
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |ele| count[ele] += 1 }
        count
    end

    def my_count(value)
        count = 0
        self.each { |ele| count += 1 if ele == value }
        count
    end

    def my_index(value)
        self.each.with_index do |ele, i|
            return i if value == ele
        end
        nil
    end

    def my_uniq
        new_array = []
        self.each do |ele|
            if new_array.none?(ele)
                new_array << ele
            end
        end
        new_array
    end

    def my_transpose
        h = self.length
        w = self[0].length
        transposed = Array.new(h){Array.new(w, 0)}

        (0...h).each do |row|
            (0...w).each do |col|
                transposed[row][col] = self[col][row]
            end
        end
        transposed
    end
end
