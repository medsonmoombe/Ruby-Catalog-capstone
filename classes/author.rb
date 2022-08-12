# Create an Author class with an association to the Item class.
require_relative './item'

class Author
  attr_accessor :first_name, :last_name, :item

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_h
    {
      first_name: first_name,
      last_name: last_name
    }
  end
end
