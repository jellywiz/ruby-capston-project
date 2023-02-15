require_relative './modules/music_module'
require_relative './modules/genre_module'
require_relative './modules/game_module'
require_relative './modules/author_module'
require_relative './modules/book_module'

require_relative './storage'

class App
  include MusicModule
  include GenreModule
  include GameModule
  include AuthorModule
  include BookModule
  def initialize
    @games = []
    @authors = []
    @labels = []
    @books = []
    @music_albums = Storage.load_data('music_albums')
    @genres = Storage.load_data('genres')
  end
  ACTIONS = {
    1 => :list_books,
    2 => :list_all_music_albums,
    3 => :list_movies,
    4 => :list_all_games,
    5 => :list_all_genres,
    6 => :list_labels,
    7 => :list_all_authors,
    8 => :list_sources,
    9 => :add_a_book,
    10 => :add_a_music_album,
    11 => :add_a_movie,
    12 => :add_a_game,
    0 => :exit
  }.freeze

  def show_interactive_console
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all movies'
    puts '4. List all games'
    puts '5. List all genres'
    puts '6. List all labels'
    puts '7. List all authors'
    puts '8. List all sources'
    puts '9. Add a book'
    puts '10. Add a music album'
    puts '11. Add a movie'
    puts '12. Add a game'
    puts '0 - Exit'
  end

  def run
    loop do
      show_interactive_console
      option = gets.chomp.to_i
      option = ACTIONS[option]
      if option == :exit
        puts 'Thank you for using the app!'
        Storage.save_data('music_albums', @music_albums) unless @music_albums.empty?
        Storage.save_data('genres', @genres) unless @genres.empty?
        break
      end

      if option
        send(option)
      else
        puts 'That is an invalid input'
      end
    end
  end
end
