# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e
    puts "Input is not a valid value"
    puts "Error was: #{e.message}"
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue StandardError => e
    if maybe_fruit == "coffee"
      puts "I love coffee but not right now! What else do you have?"
      retry
    else
      puts "I don't like that fruit. I'm going home."
      puts "Error was: #{e.message}"
      exit
    end
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    unless @yrs_known >= 5
      raise ArgumentError.new "We can't be best friends until we've known each other for at least 5 years!"
    end

    # unless @name.length <= 0 && @fav_pastime.length <= 0
    unless !@name.empty? || !@fav_pastime.empty?
      raise ArgumentError.new "You have to have a name or a favorite activity!"
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


