class CLI

  def start
    puts "Welcome to Game Stop store browser!!!"
    Scraper.scrape_games
    menu
  end
  
  def menu
    input = ''

    until input == 'exit'
      puts "Please select a video game by number to view the details or enter 'exit' to quit: "
      games = Game.all
      games.each.with_index(1) do |game, index|
        puts "#{index}. #{game.title}"
      end

      input = gets.strip
      
      if input.to_i.between?(1, Game.all.size)
        index = input.to_i - 1

        game = Game.all[index]
        Scraper.scrape_game_details(game)
        display_details(game)
      else
        puts "Goodbye!"
      end
    end
  end

  def display_details(game)
    puts ""
    puts "Price: #{game.price}"
    puts "Publisher: #{game.publisher}"
    puts "Details: #{game.details}"
    puts ""
  end

end