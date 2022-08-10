# Add a game to the list of games
require './game'

def add_game
  puts 'Add a game:'
  puts ''
  puts 'Name:'
  name = gets.chomp
  puts 'Multiplayer (y/n):'
  multiplayer = gets.chomp
  puts 'Last played at:'
  last_played_at = gets.chomp
  puts 'Published (y/n):'
  published = gets.chomp
  puts 'Archived (y/n):'
  archived = gets.chomp
  Game.new(name, multiplayer, last_played_at, published, archived: archived)
end
