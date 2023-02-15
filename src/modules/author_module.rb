require_relative '../classes/author'

module AuthorModule
  def list_all_authors
    puts 'Authors:'
    @authors.each do |author|
      puts "First Name: #{author.first_name}"
      puts "Last Name: #{author.last_name}"
    end
  end
end