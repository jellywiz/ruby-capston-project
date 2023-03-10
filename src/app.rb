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
    @games = Storage.load_data('games').empty? ? [] : Storage.load_data('games')
    @authors = Storage.load_data('authors').empty? ? [] : Storage.load_data('authors')
    @labels = Storage.load_data('labels').empty? ? [] : Storage.load_data('labels')
    @books = Storage.load_data('books').empty? ? [] : Storage.load_data('books')
    @music_albums = Storage.load_data('music_albums').empty? ? [] : Storage.load_data('music_albums')
    @genres = Storage.load_data('genres').empty? ? [] : Storage.load_data('genres')
  end
  ACTIONS = {
    1 => :list_books,
    2 => :list_all_music_albums,
    3 => :list_all_games,
    4 => :list_all_genres,
    5 => :list_labels,
    6 => :list_all_authors,
    7 => :add_a_book,
    8 => :add_a_music_album,
    9 => :add_a_game,
    0 => :exit
  }.freeze

  def show_interactive_console
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all games'
    puts '4. List all genres'
    puts '5. List all labels'
    puts '6. List all authors'
    puts '7. Add a book'
    puts '8. Add a music album'
    puts '9. Add a game'
    puts '0 - Exit'
  end

  # rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
  def run
    loop do
      show_interactive_console
      option = gets.chomp.to_i
      option = ACTIONS[option]
      if option == :exit
        puts 'Thank you for using the app!'
        Storage.save_data('music_albums', @music_albums) unless @music_albums.empty?
        Storage.save_data('genres', @genres) unless @genres.empty?
        Storage.save_data('games', @games) unless @games.empty?
        Storage.save_data('authors', @authors) unless @authors.empty?
        Storage.save_data('labels', @labels) unless @labels.empty?
        Storage.save_data('books', @books) unless @books.empty?
        break
      end
      # rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity

      if option
        send(option)
      else
        puts 'That is an invalid input'
      end
    end
  end
end
