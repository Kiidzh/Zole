require_relative "../card_shuffler"
require_relative "../card"
require_relative "../deck"

require 'test/unit'
require 'mocha/test_unit'

class CardShufflerTest < Test::Unit::TestCase 

  def card_shuffler_should_have_an_instance_of_an_deck
    shuffler = CardShuffler.new(deck)
    assert_not_nil(shuffler.deck)
  end
  
  def test_new_should_not_shuffle_cards_immidiately
       
  end
  
  private 
  
end