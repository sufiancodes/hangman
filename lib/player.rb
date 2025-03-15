require 'json'
class Player
  def initialize
    @name = ''
    @hash = {}
  end
  def welcome
    puts "Welcome whats your name"
    @name = gets.chomp
    puts "Let the game began #{@name}"
  end
  def save_the_game
    puts "Do you want to save the game"
    save_game = gets.chomp.downcase
    save_serialize_objects if save_game == 'yes'
  end
  def load_saved_game_or_load_random_word
    if ask_to_load_game == 'yes'
      load_game_from_json_file
    else
      load_random_secret_word
    end
  end
  def assign_json_values_to_instance_variable
    @secret_word = @hash["secret_word"]
    @total_guesses = @hash["total_guesses"]
    @display_dashes = @hash["display_dashes"]
    @incorrect_letters = @hash["incorrect_letters"]
    @display_words_array = @hash["display_words_array"]
  end
  private
  def ask_to_load_game
    puts "Do you want to load the saved game"
    saved_game = gets.chomp.downcase
    return saved_game
  end
  def serialized_objects
    data = {secret_word: @secret_word, total_guesses: @total_guesses, display_dashes: @display_dashes, incorrect_letters: @incorrect_letters, display_words_array: @display_words_array}
    object = JSON::dump(data)
    return object
  end
  def save_serialize_objects
    puts "whats the name of file"
    name = gets.chomp
    File.write("#{name}.json" , serialized_objects)
  end
  def load_game_from_json_file
    puts "name of file without json ext"
    name_of_file = gets.chomp
    data = File.read("#{name_of_file}.json")
    @hash = JSON::load(data)
    assign_json_values_to_instance_variable
  end
end