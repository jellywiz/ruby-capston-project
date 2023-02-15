require_relative '../classes/game'
module GameModule
  def list_all_games
    puts 'Music Albums: '
    @games.each_with_index do |game, index|
      puts "#{index + 1}) Multiplayer: #{game.multiplayer}, Publish Date: #{games.publish_date},
      Last played date: #{game.last_played_at}"
    end
  end
  
  def add_a_game
    puts 'Please write multiplayer: '
      multiplayer = gets.chomp
  
      puts 'Please write date of publish [Enter date in format (yyyy-mm-dd)]'
      publish_date = gets.chomp
  
      puts 'Please write last played date [Enter date in format (yyyy-mm-dd)]'
      last_played_date = gets.chomp
  
      @games.push(Game.new(publish_date, multiplayer, last_played_date))
      puts 'Game is created'
  end
end
