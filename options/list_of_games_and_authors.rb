# show the list of games
module GameLists
  def list_all_games
    puts 'Add a game.' if @games.empty?
    @games.each do |game|
      puts "name: #{game.name},
        published: #{game.published},
        multiplayer: #{game.multiplayer},
        last_played_at: #{game.last_played_at},
        archived: #{game.archived}"
    end
  end

  def add_game(name, published, multiplayer, last_played_at)
    @games << Game.new(name, published, multiplayer, last_played_at)
    puts "Game #{name} added!"
  end

  def archived_game(name)
    @games.each do |game|
      game.name == name && game.archived = true
    end
  end

  def list_all_authors
    puts 'Add an author.' if @authors.empty?
    @authors.each do |author|
      puts "name: #{author.first_name} #{author.last_name},
         id: #{author.id},
         items: #{author.items}"
    end
  end
end
