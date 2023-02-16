class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title, color)
    @id = rand(1000...1)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items
    }.to_json(*args)
  end

  def self.json_create(object)
    label = new(object['title'], object['color'])
    label.id = object['id']
    label.items = object['items']
    label
  end
end
