require_relative './label_module'
require_relative '../classes/book'
require_relative '../classes/game'
require_relative './utils'

module BookModule
  include LabelModule
  include Utils

  def add_a_book
    puts 'Adding a book'
    puts 'Enter the publication date of the book [Enter date in format (yyyy-mm-dd)]'
    publication_date = gets.chomp
    puts 'Enter the publisher of the book'
    publisher = gets.chomp
    puts 'Enter the state of the cover for the book'
    cover_state = gets.chomp
    new_book = Book.new(publication_date, publisher, cover_state)
    @books << new_book

    add_list('labels')
    select_options('label')

    label_option = gets.chomp.to_i
    # list all labels if 1 is selected
    if label_option == 1
      list_labels
      puts 'Select a label'
      label_option = gets.chomp.to_i
      new_book.add_label(@labels[label_option - 1])
    else
      puts 'Enter the title of the label'
      label_title = gets.chomp
      puts 'Enter the color of the label'
      label_color = gets.chomp
      new_label = Label.new(label_title, label_color)
      @labels << new_label
      new_book.add_label(new_label)
      puts 'Label added successfully'
    end
  end

  def list_books
    puts 'Listing all books'
    if @books.empty?
      puts 'There are no books in the catalog'
    else
      @books.each do |book|
        puts "Publisher: #{book.publisher}, Publication Date: #{book.publish_date}"
      end
    end
  end
end
