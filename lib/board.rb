class Board
  attr_reader :secret_word, :guesses
  def initialize
    @secret_word = ''
    @total_guesses = 0
    @display_dashes = []
    @current_guess = ''
    @incorrect_letters = []
  end
  def load_random_secret_word
    file = File.open('words.txt')
    @secret_word = file.readlines[rand(9894)]
    file.close
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
    @display_dashes = Array.new(@secret_word.length - 1,"_")
    guess = find_index_of_guess_word
    @display_dashes[guess] = @guess
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
  def find_index_of_guess_word
    display_array = @secret_word.split('')
    display_array.pop
    index = display_array.find_index(@guess)
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

game = Board.new
game.load_random_secret_word
puts game.secret_word
game.take_input_update_display
game.render_views