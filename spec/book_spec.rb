require 'date'
require_relative '../classes/book'
require_relative '../classes/item'

# Book method tests
describe Book do
  before :each do
    @book = Book.new('Emmanuel', '2020-07-06', 'Good')
  end

  it 'Must be a new instance of a Book class' do
    expect(@book).to be_an_instance_of Book
  end

  it 'Should return the publisher name correctly' do
    expect(@book.publisher).to eq('Emmanuel')
  end

  it 'should return the cover_state name correctly ' do
    expect(@book.cover_state).to eq('Good')
  end

  it 'Should return the correct date ' do
    expect(@book.publish_date).to eq('2020-07-06')
  end

  it 'should return the archieved property to  be true ' do
    expect(@book.can_be_archived?).to eq(true)
  end
end
