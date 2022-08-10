# Test for the class game
require './classes/item'
require './game'
require './author'

describe Game do
  context 'created' do
    name = 'Call of Duty'
    multiplayer = true
    last_played_at = Date.today
    published = true
    archived = false

    before(:each) do
      @game = Game.new(name, multiplayer, last_played_at, published, archived: archived)
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
    it 'should be published' do
      expect(@game.published).to eq(true)
    end
    it 'should be archived' do
      expect(@game.archived).to eq(false)
    end
  end
end
