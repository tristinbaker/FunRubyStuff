require './random_game'
require 'discordrb'

bot = Discordrb::Bot.new token: 'DISCORD BOT TOKEN GOES HERE'

bot.message(content: ';;game') do |event|
	message = event.respond "Retrieving Game..."
	user = event.user.nick.nil? ? event.user.username : event.user.nick
	game = RandomGame.get_game_by_user(event.user.discriminator)
	if game.nil?
		send_message = "No games found! Do you have your Steam game details set to private?"
	else
		send_message = "#{user}, you should play #{game}."
	end
	message.edit send_message
end

bot.run