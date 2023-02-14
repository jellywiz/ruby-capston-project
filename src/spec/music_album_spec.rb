require_relative '../classes/music_album.rb'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new true, '2023-02-01'
  end

  it 'takes two parameters and returns a MusicAlbum object' do
    expect(@music_album).to be_an_instance_of MusicAlbum
  end

  it "should return true when parent's method returns true AND if on_spotify equals true" do
    expect(@music_album.can_be_archived?).to eql true
  end
end