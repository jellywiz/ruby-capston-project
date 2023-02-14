require_relative '../classes/music_album.rb'
require_relative '../classes/genre.rb'
require_relative './genre_module.rb'

module MusicModule
  include GenreModule

  def add_a_music_album
    print 'Is it on spotify? [y/n] : '
    on_spotify = gets.chomp.to_s.downcase == 'y'
    print 'Please enter the published date : '
    published_date = gets.chomp.to_s

    music_album = MusicAlbum.new(on_spotify, published_date)
    @music_albums << music_album

    genre = add_genre
    genre.add_item(music_album)

    puts "Album of #{genre.name} genre added successfully!"
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No album added!'
    else
      @music_albums.each_with_index do |album, index|
        print "#{index + 1}. Published date : #{album.publish_date}, "
        if album.on_spotify
          puts "Available on spotify." 
        else
          puts "Not available on spotify."
        end
      end
    end
  end
end