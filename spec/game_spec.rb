# Test for the class game
require_relative '../classes/game'

describe Game do
  context 'created' do
    name = 'Call of Duty'
    multiplayer = true
    last_played_at = Date.today

    before(:each) do
      @game = Game.new(name, multiplayer, last_played_at)
    end

    it 'should have a name' do
      expect(@game.name).to eq(name)
    end
    it 'should be multiplayed' do
      expect(@game.multiplayer).to eq(true)
    end
    it 'should have a last played at date' do
      expect(@game.last_played_at).to eq(Date.today)
    end
  end
end
