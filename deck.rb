require_relative "card"
class Deck
  include Enumerable
  
  attr_reader :cards
  
  def initialize(card_generator)
    @cards = card_generator.generate
  end  
  
  def each
    @cards.each { |card| yield card }
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