require_relative '../classes/music_album.rb'
require_relative '../classes/genre.rb'

module MusicModule
  def add_a_music_album
    print 'Is it on spotify? [y/n] : '
    on_spotify = gets.chomp.to_s.downcase == 'y'
    print 'Please enter the published date : '
    published_date = gets.chomp.to_s
    music_album = MusicAlbum.new(on_spotify, published_date)
    @music_albums << music_album
    puts 'Album added successfully!'
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No album added!'
    else
      @music_albums.each_with_index do |album, index|
        print "#{index + 1}. "
        if album.on_spotify
          print "Album available on spotify." 
        else
          print "Album not available on spotify."
        end
        puts " Published date : #{album.publish_date}"
      end
    end
  end
end