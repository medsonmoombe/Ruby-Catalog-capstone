## rubocop:disable Style/FrozenStringLiteralComment
require 'date'
# create game class
class Game
  attr_accessor :multipayer, :last_play_at

  def initialize(multipayer)
    @multipayer = multipayer
    @last_play_at = DateTime.now
  end

  def can_be_archived?
    if super && last_play_at < 2.years.ago
      true
    else
      false
    end
  end
end
