require_relative './item'

# Create Book class
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, publish_date, cover_state)
    super(publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    true if Date.parse(publish_date) > 10 || cover_state == 'bad'
  end
end
