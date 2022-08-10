require 'date'
# create game class
class Game
  attr_accessor :name, :multiplayer, :last_played_at, :published, :archived

  def initialize(name, multiplayer, last_played_at, published, archived: false)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @published = published
    @archived = archived
  end

  private

  def can_be_archived?
    super && last_played_at < 2.years.ago
  end
end
