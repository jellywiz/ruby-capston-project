require_relative '../classes/label'

module LabelModule
  def list_labels
    puts 'Listing all labels and their corresponding items'
    if @labels.empty?
      puts 'There are no labels in the catalog'
    else
      @labels.each_with_index do |label, index|
        puts "[Label #{index + 1}]. Title: #{label.title}, Color: #{label.color}"
      end
    end
  end
end
