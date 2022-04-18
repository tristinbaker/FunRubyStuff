require '../web_scraper/scraper'

class RandomGame

	def self.get_game_by_user(user)
		return "I don't even know you man." if urls[user].nil?
		scraper = Scraper.new
		url = urls[user]
		scraper.set_url(url)
		scraper.set_content
		games = scraper.get_element_by_class('div', 'gameListRowItemName')
		games.sample
	end

	def self.urls
		{ 
			'6908' => "STEAM PROFILE LINK GOES HERE", 
			'6722' => "STEAM PROFILE LINK GOES HERE",
			'0451' => "STEAM PROFILE LINK GOES HERE",
			'9620' => "STEAM PROFILE LINK GOES HERE",
			'6285' => "STEAM PROFILE LINK GOES HERE",
			'7572' => "STEAM PROFILE LINK GOES HERE",
			'9981' => "STEAM PROFILE LINK GOES HERE",
			'1023' => "STEAM PROFILE LINK GOES HERE"
		}
	end
end
