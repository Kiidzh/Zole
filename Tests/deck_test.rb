require "test/unit"
require_relative "../deck"
require_relative "../card_generator_zole"
   
class DeckTest < Test::Unit::TestCase
 
  def setup
    @deck = Deck.new(FakeCardGeneratorWith2Cards)
  end
  
  def test_top_card_should_return_the_top_card
    card = @deck.top_card
    assert_not_nil(card)      
  end     
  
  def test_top_card_should_not_change_the_deck_size    
    card = @deck.top_card
    assert_equal(2, @deck.cards.count)
  end 
  
  def test_remove_top_card_should_remove_the_top_card
    card = @deck.top_card
    @deck.remove_top_card
    
    assert(! @deck.cards.include?(card))    
  end 
end

class FakeCardGeneratorWith2Cards
  def self.generate
    cards = []
    cards.push(Card.new("D", "7"))
    cards.push(Card.new("D", "8"))
    cards
  end  
end  
