def average(num1, num2)
    average = (num1 + num2) / 2.0
end

def average_array(array)
    average = array.inject { |sum, num| sum + num } / (array.length + 0.0)
end

def repeat(str, num)
    str = str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    arr = str.split(" ")

    arr.each_with_index do |word, i|
        if i % 2 == 0
            arr[i] = word.upcase
        else
            arr[i] = word.downcase
        end
    end

    arr.join(" ")
end