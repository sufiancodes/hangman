class Player
  def initialize
    @name = ''
  end
  def welcome
    puts "Welcome whats your name"
    @name = get.chomp
    puts "Let the game began #{@name}"
  end
end