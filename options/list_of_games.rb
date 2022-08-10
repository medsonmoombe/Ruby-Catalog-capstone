# show the list of games
require './game'

def list_of_games
  puts 'List of games:'
  puts ''
  puts 'ID  Name
    ----------------------------------------'
  Game.all.each do |game|
    puts "#{game.id}  #{game.name}"
  end
  puts ''
end
