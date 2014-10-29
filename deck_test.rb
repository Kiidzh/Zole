require "test/unit"
require_relative "deck"
      
class DeckTest < Test::Unit::TestCase
 
  def test_new_should_have_26_cards
    deck = Deck.new
    assert_equal(26, deck.cards.count)    
	end
	
	def test_new_should_generate_7_of_diamonds
	  deck = Deck.new
	  cards = deck.cards
	  assert_not_nil( cards.find {|x| x.suit == "D" and x.rank == "7"})
	end  
	
  def test_new_should_generate_8_of_diamonds
    deck = Deck.new
    cards = deck.cards
    assert_not_nil( cards.find {|x| x.suit == "D" and x.rank == "8"})
  end  

  def test_new_should_generate_4_queens
    deck = Deck.new
    cards = deck.cards
    
    assert_not_nil( cards.find { |x| x.suit == "S" and x.rank == "Q"})
    assert_not_nil( cards.find { |x| x.suit == "C" and x.rank == "Q"})
    assert_not_nil( cards.find { |x| x.suit == "H" and x.rank == "Q"})
    assert_not_nil( cards.find { |x| x.suit == "D" and x.rank == "Q"})
        
  end
  
  
  
end