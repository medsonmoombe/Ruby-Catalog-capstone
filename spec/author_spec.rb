# Test for the class author
require_relative '../classes/author'

describe Author do
  context 'created' do
    first_name = 'John'
    last_name = 'Doe'

    before(:each) do
      @author = Author.new(first_name, last_name)
    end

    it 'should have a first name' do
      expect(@author.first_name).to eq(first_name)
    end
    it 'should have a last name' do
      expect(@author.last_name).to eq(last_name)
    end
  end
end
