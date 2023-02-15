require_relative './label_module'
require_relative '../classes/book'

module BookModule
  include LabelModule

  def list_books
    puts 'Listing all books'
    if @books.empty?
      puts 'There are no books in the catalog'
    else
      @books.each do |book|
        puts "Publisher: #{book.publisher},
              Publication Date: #{book.publish_date},
              Author: #{book.author},
              Genre: #{book.genre},
              Label: #{book.label.title}"
      end
    end
  end

  def add_a_book
    puts 'Adding a book'
    puts 'Enter the publication date of the book'
    publication_date = gets.chomp
    puts 'Enter the publisher of the book'
    publisher = gets.chomp
    puts 'Enter the state of the cover for the book'
    cover_state = gets.chomp
    puts 'Enter the author of the book'
    author = gets.chomp
    puts 'Enter the label of the book'
    label_title = gets.chomp
    puts 'Enter the genre of the book'
    genre = gets.chomp
    new_book = Book.new(publication_date, publisher, cover_state)
    @books << new_book
    unless @labels.any? { |label| label.title == label_title }
      new_label = Label.new(label_title)
      @labels << new_label
      new_book.add_label(new_label)
    else
      old_label = @labels.select { |label| label.title == label_title }
      new_book.add_label(old_label.first)
    end
  end
end
