class Genre
  attr_reader :items
  attr_accessor :name, :id

  def initialize(name)
    @id = rand(50...555)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self

  def to_hash
    {
      'id' => @id,
      'name' => @name,
      'items' => @items
    }
  end
end