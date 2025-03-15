require 'json'
class Player
  def initialize
    @name = ''
  end
  def save_the_game
    puts "Do you want to save the game"
    save_game = gets.chomp.downcase
    save_serialize_objects if save_game == 'yes'
  end
  def welcome
    puts "Welcome whats your name"
    @name = get.chomp
    puts "Let the game began #{@name}"
  end
  private
  def serialized_objects
    
  end
  def save_serialize_objects
    puts "whats the name of file"
    name = gets.chomp
    File.write("#{name}.json" , 'Hello, world')
  end
end