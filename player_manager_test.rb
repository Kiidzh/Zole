require "test/unit"
      
require_relative "player_manager"
require_relative "player"

class PlayerManagerTest < Test::Unit::TestCase
  
  def setup
    @player_manager = PlayerManager.new("player1", "player2", "player3")
  end
  
  def test_new_should_create_3_players
    assert_not_nil(@player_manager.get_player("player1"))
    assert_not_nil(@player_manager.get_player("player2"))
    assert_not_nil(@player_manager.get_player("player3"))
  end
  
  def test_get_player_should_return_player
    player = @player_manager.get_player("player1")
    assert_not_nil(player) 
  end
  
  def test_add_player_card_should_add_a_card_to_players_hand
    @player_manager.add_card(Card.new("C","A"), "player1")
    cards = @player_manager.get_players_cards("player1")
    assert_equal(1, cards.count)    
  end
    
  
end