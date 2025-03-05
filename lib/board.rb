class Board
  attr_reader :secret_word, :guesses
  def initialize
    @secret_word = ''
    @guesses = 6
    @display_array = []
  end
  def load_random_secret_word
    file = File.open('words.txt')
    @secret_word = file.readlines[rand(9894)]
    file.close
  end
  def render_hangman
    if @guesses == 0
      puts "``` |"
    elsif @guesses == 1
      puts " O  |"
    elsif @guesses == 2
      puts " O  |"
      puts " |  |"
    elsif @guesses == 3
      puts " O  |"
      puts "/|  |"
    elsif @guesses == 4
      puts " O  |"
      puts "/|\\ |"
    elsif @guesses == 5
      puts " O  |"
      puts "/|\\ |"
      puts "/   |"
    elsif @guesses == 6
      puts " O  |"
      puts "/|\\ |"
      puts "/ \\ |"
    end
  end
  def take_input
    puts "Enter the character"
    guess = gets.chomp
    @display_array = @secret_word.split('')
    @display_array.pop
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
    dashes = secret_word.length - 1
    dashes.times { print "_ "}
    puts 
  end
end

game = Board.new
game.load_random_secret_word
puts game.secret_word
game.render_views
game.make_guess