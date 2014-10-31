require_relative "../zole"
require_relative "../card"
require_relative "../player"
require_relative "../player_manager"

require "test/unit"

class ZoleTest < Test::Unit::TestCase
  def setup
    @zole = Zole.new("Player1", "Player2", "Player3")
  end

  def test_new_should_create_3_players
    player1 = @zole.get_player("Player1")
    player2 = @zole.get_player("Player2")
    player3 = @zole.get_player("Player3")

    assert_not_nil(player1)
    assert_not_nil(player2)
    assert_not_nil(player3)

  end

  def test_new_should_set_player_names
    player = @zole.get_player("Player1")
    assert_not_nil(player)
    assert_equal("Player1", player.name)
  end

  def test_new_should_assign_a_player_8_cards
    playerCards = @zole.get_players_cards("Player1")
    assert_equal(8, playerCards.count)
  end

 # def test_new_each_players_card_should_be_different
 #   firstPlayer = @zole.players[0]
 #   playerCards = firstPlayer.get_cards
 # end

 # def test_each_player_should_have_different_cards
 #   firstPlayer = @zole.players[0]
 #   firstPlayersCards = firstPlayer.get_cards
 # end
end