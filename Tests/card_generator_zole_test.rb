require "test/unit"      
require_relative "../card_generator_zole"
require_relative "../card"

class CardGeneratorZoleTest < Test::Unit::TestCase
 
  def setup
    @cards = CardGeneratorZole.generate     
  end
  
  def test_generate_should_have_26_cards
    assert_equal(26, @cards.count)    
  end
  
  def test_new_should_generate_6_spades
    assert_equal(6, @cards.find_all { |x| x.suit == "S"}.count)
  end  
  
  def test_new_should_generate_7_of_diamonds
    assert_not_nil( @cards.find {|x| x.suit == "D" and x.rank == "7"})
  end  
  
  def test_new_should_generate_8_of_diamonds
    assert_not_nil( @cards.find {|x| x.suit == "D" and x.rank == "8"})
  end  

  def test_new_should_generate_4_queens
      
    assert_not_nil( @cards.find { |x| x.suit == "S" and x.rank == "Q"})
    assert_not_nil( @cards.find { |x| x.suit == "C" and x.rank == "Q"})
    assert_not_nil( @cards.find { |x| x.suit == "H" and x.rank == "Q"})
    assert_not_nil( @cards.find { |x| x.suit == "D" and x.rank == "Q"})
        
  end
  
end