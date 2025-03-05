class Board
  attr_accessor :secret_word
  def initialize
    @secret_word = ''
  end
  def load_random_secret_word
    file = File.open('words.txt')
    @secret_word = file.readlines[rand(9894)]
    file.close
  end
  
end

game = Board.new
game.load_random_secret_word
puts game.secret_word