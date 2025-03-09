require_relative 'board'
class Game < Board
  def play_game
    load_random_secret_word
    p @secret_word
    loop do
      take_input_update_display
      render_views
      break if @total_guesses == 6
      break if @display_dashes == @display_words_array
    end
  end
  
end