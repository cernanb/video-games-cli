class Scraper

  BASE_URL = "https://www.gamestop.com"

  def self.scrape_games
    page = Nokogiri::HTML(open("https://www.gamestop.com/browse/games/playstation-4?nav=28-xu0,131dc-ffff2418"))  
    page.css('.product').each do |game|
      title = game.css('.ats-product-title a').text
      url = game.css('.ats-product-title a').attribute('href').value
      game = Game.new(title, url)
    end
  end
  
  def self.scrape_game_details(game)
    page = Nokogiri::HTML(open(BASE_URL + game.url))  
    game.price = page.css('.buy1 .ats-prodBuy-price').text.strip
    game.details = page.css('p.productbyline').text.strip
    game.publisher = page.css('cite').text.split("\n")[1].strip
    #use nokogiri to scrape the additional game details publisher, platform, rating

  end

end