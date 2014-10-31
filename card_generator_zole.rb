require_relative "card"

class CardGeneratorZole
  
  def self.generate
    
    suits = ["S","H","D","C"]
    common_ranks = ["9","10","J","Q","K","A"]
    
    cards = []
    for suit in suits
      for rank in common_ranks
        cards.push(Card.new(suit,rank))
      end
    end  
    cards.push(Card.new("D", "7"))
    cards.push(Card.new("D", "8"))
    cards
  end    
end