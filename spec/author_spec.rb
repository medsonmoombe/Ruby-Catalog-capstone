# Test for the class author
require './classes/item'
require './game'
require './author'

describe Author do
  context 'created' do
    id = 1
    first_name = 'John'
    last_name = 'Doe'
    items = []

    before(:each) do
      @author = Author.new(id, first_name, last_name, items)
    end
    it 'should have an ID' do
      expect(@author.id).to eq(1)
    end
    it 'should have a first name and a last name' do
      expect(@author.first_name).to eq('John')
      expect(@author.last_name).to eq('Doe')
    end
    it 'should have an items array' do
      expect(@author.items).to eq([])
    end
  end
end
