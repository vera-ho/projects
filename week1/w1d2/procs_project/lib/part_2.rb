require "byebug"

def reverser(str, &prc)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    arr = []

    prc.call(str).each_char do |char|
        if alpha.include?(char.downcase)
            arr.unshift(char)
        else
            arr.push(char)
        end
    end
    arr.join("")
end

def word_changer(sentence, &prc)
    newSentence = []
    words =  sentence.split(" ")
    words.each { |word| newSentence << prc.call(word) }
    newSentence.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    num1 = prc1.call(num)
    num2 = prc2.call(num)

    if num1 > num2
        return num1
    else
        return num2
    end
end

def and_selector(arr, prc1, prc2)
    andArr = []

    arr.each do |ele|
        if prc1.call(ele) && prc2.call(ele)
            andArr << ele
        end
    end
    andArr
end

def alternating_mapper(arr, prc1, prc2)
    altArr = []
    arr.each_with_index do |ele, i| 
        if i % 2 == 0
            altArr << prc1.call(ele)
        else 
            altArr << prc2.call(ele)
        end
    end

    altArr
end