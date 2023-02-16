require_relative '../classes/game'
require_relative '../classes/author'
require_relative './author_module'
module GameModule
  def list_all_games
    puts 'Music Albums: '
    if @games.empty?
      puts "\nNo added games yet. Please add some games . . . "
    else
      @games.each_with_index do |game, index|
        # rubocop:disable Layout/LineLength
        puts "[Game #{index + 1}]. Multiplayer : #{game.multiplayer}, Publish Date : #{game.publish_date}, Last Played Date : #{game.last_played_at}"
        # rubocop:enable Layout/LineLength
      end
    end
  end

  def add_a_game
    puts 'Is it a multiplayer game? [Y/N]: '
    multiplayer = gets.chomp.to_s.downcase == 'y'

    puts 'Please write publish date for game [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp

    puts 'Please write last played date [Enter date in format (yyyy-mm-dd)]'
    last_played_date = gets.chomp

    game = Game.new(publish_date, multiplayer, last_played_date)

    @games.push(game)
    author = add_author
    author.add_item(game)

    puts "Game created with #{author.first_name} author added successfully!"
  end
end
