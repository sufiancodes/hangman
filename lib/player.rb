require 'json'
class Player
  def initialize
    @name = ''
  end
  def welcome
    puts "Welcome whats your name"
    @name = get.chomp
    puts "Let the game began #{@name}"
  end
  def save_the_game
    puts "Do you want to save the game"
    save_game = gets.chomp.downcase
    save_serialize_objects if save_game == 'yes'
  end
  private
  def serialized_objects
    data = {secret_word: @secret_word, total_guesses: @total_guesses, display_dashes: @display_dashes, incorrect_letters: @incorrect_letters, display_words_array: @display_words_array}
    object = JSON::dump(data)
  end
  def save_serialize_objects
    puts "whats the name of file"
    name = gets.chomp
    File.write("#{name}.json" , serialized_objects)
  end
end