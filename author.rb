# Create an Author class with an association to the Item class.
require './classes/item'
class Author < Item
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(id, first_name, last_name, items)
    super(first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = items
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
