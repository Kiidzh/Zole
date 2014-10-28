require_relative "player"
require "test/unit"

class PlayerTest < Test::Unit::TestCase
  
  def test_new_should_be_able_to_set_name
    
    player = Player.new("Player1")
    assert_equal("Player1", player.name)
    
  end  
end