# rubocop:disable Metrics/CyclomaticComplexity
require './classes/item'
require './options/list_of_games_and_authors'

class Options
  include List

  def initialize
    @items = []
    @games = load_games
    @authors = load_authors
  end

  def show_menu
    puts 'Enter a number to choose an option below: '
    puts '1. List All Books'
    puts '2. List All Labels'
    puts '3. List All Music Albums'
    puts '4. List All Genres'
    puts '5. List Of Games'
    puts '6. List All Authors'
    puts '7. Add A Book'
    puts '8. Add a Music Album'
    puts '9. Add A Genre'
    puts '10. Add A Game'
    puts '11. Add An Author'
    puts '12. Add Label'
    puts '13. Quit'
  end

  def menu_options(option)
    case option
    when '1'
      #   list_book
    when '2'
      #   list_label
    when '3'
      #   all_music_albums
    when '4'
      #  all_genres
    when '5'
      list_all_games
    when '6'
      list_all_authors
    when '7'
      # add_book
    when '8'
      # add_music_album
    when '9'
      # add_genre
    when '10'
      add_game
    when '11'
      add_author
    when '12'
      # add_label
    when '13'
      puts 'Goodbye!'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
