require 'json'
class Player
  def initialize
    @name = ''
  end
  def serialize_objects
    puts "whats the name of file"
    name = gets.chomp
    File.write("#{name}.json" , 'Hello, world')
  end
  def save_the_game
    puts "Do you want to save the game"
    save_game = gets.chomp.downcase
    serialize_objects if save_game == 'yes'
  end
  def welcome
    puts "Welcome whats your name"
    @name = get.chomp
    puts "Let the game began #{@name}"
  end
end