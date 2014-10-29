require_relative "card"
class Deck
  
  SUITS = ["S","H","D","C"]
  RANKS = ["7","8", "9","10","J","Q","K","A"]
  COMMON_RANKS = ["9","10","J","Q","K","A"]  
    
  attr_reader :cards
  
  def initialize
    @cards = []
    generate_cards
  end  
  
  
  def generate_cards
    
    for suit in SUITS
      for rank in COMMON_RANKS
        @cards.push(Card.new(suit,rank))
      end
    end    
    @cards.push(Card.new("D", "7"))
    @cards.push(Card.new("D", "8"))
        
  end
end