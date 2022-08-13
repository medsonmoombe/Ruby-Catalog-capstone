require './utils/options'
require_relative './options/list_of_games_and_authors'

# show catalog menu
class App
  def initialize
    @options = Options.new
    @games = []
    @authors = []
  end

  def run
    puts '     Welcome to      '
    puts '  Catalog Of Things  '
    puts ''

    loop do
      @options.show_menu
      print 'Option: '
      option = gets.chomp
      exit if option == '13'
      @options.menu_options(option)
      @options.save_game
      @options.save_author
      @options.save_label
      @options.save_music_album
      @options.save_genre
      @options.save_book
    end
    puts 'Bye'
  end
end
