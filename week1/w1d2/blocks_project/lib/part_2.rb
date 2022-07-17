def all_words_capitalized?(words)
    words.all? do |word| 
        if word[0].upcase == word[0] && word[1..-1].downcase == word[1..-1]
            true
        else 
            false
        end
    end
end

def no_valid_url?(urls)
    urls.none? do |url|
        if url.include?(".com") || url.include?(".net") || url.include?(".io") || url.include?(".org") 
            true
        else
            false
        end
    end
end

def any_passing_students?(students)
    students.any? do |student|  
        avg = (student[:grades].sum / student[:grades].length) + 0.0
        avg > 75
    end
end