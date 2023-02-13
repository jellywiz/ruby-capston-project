require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    (Date.today - publish_date) > 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end