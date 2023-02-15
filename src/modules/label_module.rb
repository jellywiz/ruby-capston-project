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
        if label.items.empty?
          puts 'There are no items with this label'
        else
          label.items.each_with_index do |item, index|
            puts "#{index}, Type: #{item.class}, ID: #{item.id}"
          end
        end
      end
    end
  end
