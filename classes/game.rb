require 'date'
require_relative './item'
# create game class
class Game < Item
  attr_accessor :name, :multiplayer, :last_played_at

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(name, multiplayer, last_played_at, archived = false, published = false)
    super(archived, published)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_h
    {
      name: name,
      multiplayer: multiplayer,
      last_played_at: last_played_at
    }
  end

  private

  def can_be_archived?
    super && (Date.today.year - last_played_at.year) > 2
  end
end
# rubocop:enable Style/OptionalBooleanParameter
