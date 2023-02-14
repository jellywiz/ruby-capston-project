require_relative '../classes/genre'
require_relative '../item'

describe Genre do
  before :each do
    @genre = Genre.new 'Abeera'
  end

  it 'takes one parameters and returns a Genre object' do
    expect(@genre).to be_an_instance_of Genre
  end

  it 'Genre items list should be empty' do
    expect(@genre.items.length).to eql 0
  end

  it 'Genre items list should have one item' do
    @genre.add_item(Item.new('2023-02-01'))
    expect(@genre.items.length).to eql 1
  end
end
