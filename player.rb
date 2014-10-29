require_relative "card"

class Player
  
  attr_reader :name
    
  def initialize(playerName)
    @name = playerName
    @cards = []    
  end
  
  def add_card(card)
    @cards.push(card)    
  end
  
  def get_cards
     return @cards
  end
end