require_relative 'player'
class Board < Player
  attr_reader :secret_word, :guesses, :display_hashes, :current_guess, :incorrect_letter, :display_words_array
  def initialize
    @secret_word = ''
    @total_guesses = 0
    @display_dashes = []
    @guess = ''
    @incorrect_letters = []
    @display_words_array = [nil]
  end
  def load_random_secret_word
    while @secret_word.length != 7
      @secret_word = File.readlines("words.txt").sample
    end
    @display_dashes = Array.new(@secret_word.length - 1 , "_")
    @display_words_array = @secret_word.split('')
    @display_words_array.pop
  end
  def render_hangman
    if @total_guesses == 0
      puts "``` |"
    elsif @total_guesses == 1
      puts " O  |"
    elsif @total_guesses == 2
      puts " O  |"
      puts " |  |"
    elsif @total_guesses == 3
      puts " O  |"
      puts "/|  |"
    elsif @total_guesses == 4
      puts " O  |"
      puts "/|\\ |"
    elsif @total_guesses == 5
      puts " O  |"
      puts "/|\\ |"
      puts "/   |"
    elsif @total_guesses == 6
      puts " O  |"
      puts "/|\\ |"
      puts "/ \\ |"
    end
  end
  def update_dashes
    @secret_word.chars.each_with_index do |char, index|
      if char == @guess
        @display_dashes[index] = @guess
      end
    end
  end
  def check_the_guess
    if @secret_word.include? @guess
      update_dashes
    else
      @incorrect_letters.push(@guess)
      @total_guesses += 1
    end
  end
  def take_input_update_display
    puts "Enter the character"
    @guess = gets.chomp.downcase
    check_the_guess
  end
  def render_gallows
    puts "____"
    puts " |  |"
    render_hangman
    3.times {puts "    |"}
    puts "   / \\"
  end
  def render_views
    render_gallows
    puts "Here are incorrect letters"
    p @incorrect_letters
    puts "Here is our Word"
    p @display_dashes
  end
end