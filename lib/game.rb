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
  def play_game
    load_random_secret_word
    loop do
      take_input_update_display
      render_views
      break if check_win_or_lose == true
    end 
  end
end