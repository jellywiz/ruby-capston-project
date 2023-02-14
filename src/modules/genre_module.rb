require_relative '../classes/genre.rb'

module GenreModule
  def list_all_genres
    if @genres.empty?
      puts "\nNo added genres. Add some genres . . . "
    else
      puts "\nExisting genres in the list:"
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
      end
    end
  end

  def select_genre
    list_all_genres
    print "\nPlease select a genre by typing the corresponding number : "
    genre_input = gets.chomp.to_i
    @genres[genre_input.to_i - 1]
  end

  def create_genre
    print 'Enter the name of the genre: '
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre
    genre
  end

  def add_genre
    if @genres.empty?
      puts "Add a genre for this item!"
      create_genre
    else
      puts "\nSelect a genre for this item or add a new one: "
      puts '[ 1 ] Select from existing genres'
      puts '[ 2 ] Add a new genre'

      input = gets.chomp.to_i

      case input
      when 1
        select_genre
      when 2
        create_genre
      else
        puts "Please enter 1 or 2!"
      end
    end
  end
end