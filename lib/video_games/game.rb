class Game
  attr_accessor :title, :url, :price, :details, :publisher
  
  @@all = []

  def initialize(title, url)
    @title = title
    @url = url
    @@all << self 
  end

  def self.all
    @@all
  end
end