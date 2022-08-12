require_relative '../classes/game'
require_relative '../classes/author'
require 'date'
require 'json'

# show the list of games
module List
  def add_game
    puts 'Add a game:'
    puts ''
    puts 'Enter the name of the game:'
    name = gets.chomp
    puts 'Is it multiplayer (y/n):'
    multiplayer = gets.chomp
    puts 'Enter last played date (yyyy-mm-dd):'
    last_played_at = gets.chomp
    puts 'Is it Published (y/n):'
    published = gets.chomp
    puts 'Is it Archived (y/n):'
    archived = gets.chomp
    @games << Game.new(name, multiplayer, last_played_at, published, archived: archived)
    puts "Game #{name} added!"
    puts ''
  end

  def list_all_games
    if @games.empty?
      puts 'There are no games in the catalog'
    else
      @games.each do |game|
        puts "#{game.name} - #{game.last_played_at} - #{game.publish_date} - #{game.archived}"
      end
    end
  end

  def load_games
    file = File.open('./data/game.json')
    json_data = file.read
    parsed_data = JSON.parse(json_data)
    file.close
    @games = parsed_data.map do |game_data|
      Game.new(game_data['name'], game_data['multiplayer'], game_data['last_played_at'], game_data['published'], game_data['archived'])
    end
  rescue StandardError
    @games = []
  end

  def save_game
    game_list = @games.map(&:to_h)
    game_json = JSON.generate(game_list)
    file = File.new('./data/game.json', 'w')
    file.write(game_json)
    file.close
  end

  def archived_game(name)
    @games.each do |game|
      game.name == name && game.archived = true
    end
  end

  def published_game(name)
    @games.each do |game|
      game.name == name && game.published = true
    end
  end

  # Create method to add an author
  def add_author
    puts '*****_____________________ADD AN AUTHOR_____________________*****'
    puts ''
    puts 'Enter the first name of the author:'
    first_name = gets.chomp
    puts 'Enter the last name of the author:'
    last_name = gets.chomp
    @authors << Author.new(first_name, last_name)
    puts "Author #{first_name} #{last_name} added!"
    puts ''
  end

  # Create a method to list all the authors
  def load_authors
    file = File.open('./data/author.json')
    json_data = file.read
    parsed_data = JSON.parse(json_data)
    file.close
    @authors = parsed_data.map do |author_data|
      Author.new(author_data['first_name'], author_data['last_name'])
    end
  rescue StandardError
    @authors = []
  end

  def save_author
    author_list = @authors.map(&:to_h)
    author_json = JSON.generate(author_list)
    file = File.new('./data/author.json', 'w')
    file.write(author_json)
    file.close
  end

  def list_all_authors
    puts '*****_____________________LIST OF AUTHORS_____________________*****'
    puts ''
    @authors.each do |author|
      puts "#{author.first_name} #{author.last_name}"
    end
    puts ''
  end
end
