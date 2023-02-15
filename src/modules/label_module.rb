require_relative '../classes/label'

module LabelModule

  def list_labels
    puts 'Listing all labels and their corresponding items'
    if @labels.empty?
      puts 'There are no labels in the catalog'
    else
      @labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
        puts "Items:"
        @labels.items.each_with_index do |item, index|
          puts "#{index}, #{item.class}, #{item.id}"
        end
      end
    end
  end

end
