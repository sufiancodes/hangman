require_relative 'board'
class Game < Board
  def play_game
    load_random_secret_word
    p @secret_word
    count = 0
    loop do
      take_input_update_display
      render_views
      count += 1
      break if count == 6
      break if @display_dashes == @display_words_array
    end
  end
  
end
game = Game.new
game.play_game