# rubocop:disable Metrics/CyclomaticComplexity
require './classes/item'
require './options/list_of_games_and_authors'
require_relative '../classes/item'
require_relative '../classes/label'
require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative '../controllers/book_controller'
require_relative '../controllers/label_controller'
require_relative '../controllers/music_album_controller'
require_relative '../controllers/genre_controller'

class Options
  include BookController
  include LabelController
  include MusicAlbumController
  include List
  include GenreController

  def initialize
    @items = []
    @labels = access_label
    @books = load_book
    @music_albums = load_music_albums
    @games = load_games
    @authors = load_authors
    @genres = access_genre
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
      list_book
    when '2'
      list_label
    when '3'
      list_music_album
    when '4'
      list_genre
    when '5'
      list_all_games
    when '6'
      list_all_authors
    when '7'
      add_book
    when '8'
      add_music_album
    when '9'
      add_genre
    when '10'
      add_game
    when '11'
      add_author
    when '12'
      add_label
    when '13'
      puts 'Goodbye!'
    end
  end
end
# rubocop: enable Metrics/CyclomaticComplexity
