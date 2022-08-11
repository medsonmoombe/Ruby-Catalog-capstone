require_relative '../classes/label'
require_relative '../classes/book'
require_relative '../classes/item'

# label class methods tests
describe Label do
  before :each do
    @label = Label.new('Hello', 'Blue')
    @book = Book.new('Emmanuel', '2020-07-06', 'Good')
  end

  it 'Should return the title property correctly' do
    expect(@label.title).to eq('Hello')
  end

  it 'Should return the color property correctly' do
    expect(@label.color).to eq('Blue')
  end

  it 'Should add and iclude the item ' do
    expect(@label.add_item(@book)).to include(@book)
  end
end
