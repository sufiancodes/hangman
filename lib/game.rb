require_relative 'board'
class Game < Board
  def check_win_or_lose
    if @display_dashes == @display_words_array
      puts "You win"
      return true
    elsif @total_guesses == 6
      puts "you lost"
      return true
    end
  end
  def play_round
    loop do
      take_input_update_display
      render_views
      save_the_game
      break if check_win_or_lose == true
    end
  end
  def play_game
    welcome
    load_saved_game_or_load_random_word
    play_round
  end
end