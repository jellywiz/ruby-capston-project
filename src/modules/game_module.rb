require_relative '../classes/game'

def list_all_games
  puts 'Music Albums: '
  @games.each_with_index do |game, index|
    puts "#{index + 1}) Multiplayer: #{game.multiplayer}, Publish Date: #{games.publish_date},
    Last played date: #{game.last_played_at}"
  end
end
