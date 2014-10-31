require_relative "card"
class Deck
     
  attr_reader :cards
  
  def initialize(card_generator)
    @cards = card_generator.generate
  end  
  
  def top_card
    @cards.at(0)
  end
  
  def remove_top_card
   @cards.delete_at(0)
  end
  
  def card_count
    @cards.count
  end
end