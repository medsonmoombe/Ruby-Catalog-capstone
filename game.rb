require 'date'
require './classes/item'
# create game class
class Game < Item
  attr_accessor :name, :multiplayer, :last_played_at

  def initialize(name, multiplayer, last_played_at)
    super(publish_date, archived)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super && last_played_at > 2.years.ago
  end
end
