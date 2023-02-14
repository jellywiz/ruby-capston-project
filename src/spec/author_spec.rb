require_relative '../classes/author'
require_relative '../item'

describe Author do
  before :each do
    @author = Author.new 'Raymond', 'Olisa'
    @item = Item.new '2023-01-15'
  end

  it '@author should be an instance of Author class' do
    expect(@author).to be_an_instance_of Author
  end

  it 'author first name to be "Raymond"' do
    @first_name == 'Raymond'
  end

  it 'author last name to be "Olisa"' do
    @last_name == 'Olisa'
  end

  it 'should return the item passed into author items array' do
    @author.add_item(@item)
    expect(@author.items.length).to eq(1)
  end
end
