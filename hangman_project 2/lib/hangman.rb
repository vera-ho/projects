class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def self.random_word
    DICTIONARY.sample
  end

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    idx_arr = []
    @secret_word.each_char.with_index { |c, i| idx_arr << i if c == char }
    idx_arr
  end

  def fill_indices(char, arr)
    arr.each { |idx| @guess_word[idx] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else # char has not been previously attempted
      @attempted_chars << char

      matches = get_matching_indices(char)
      if matches.length > 0
        fill_indices(char, matches)
      else
        @remaining_incorrect_guesses -= 1
      end

      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    guess = gets.chomp
    try_guess(guess)    
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end
end