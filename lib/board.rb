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
  def take_input
    puts "Enter the character"
    @guess = gets.chomp
    if @secret_word.include? @guess
      
    else
      @incorrect_letters.push(@guess)
      @total_guesses += 1
    end
  end
  def find_index
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
    @display_dashes = Array.new(@secret_word.length - 1,"_")
    puts @display_dashes
  end
end

game = Board.new
game.load_random_secret_word
puts game.secret_word
game.take_input
game.render_views

arr = ["a","b","c","d","e","f"]
arr.each do |value|
  print " #{value}"
end