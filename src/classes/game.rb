require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    @id = rand(1..1000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end