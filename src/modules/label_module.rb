require_relative '../classes/label'

module LabelModule
  def list_labels
    puts 'Listing all labels and their corresponding items'
    if @labels.empty?
      puts 'There are no labels in the catalog'
    else
      # use index
      @labels.each_with_index do |label, index|
        puts "No: #{index} ID #{label.id} Title: #{label.title}, Color: #{label.color}"
      end
    end
  end
end
