require_relative "zole"
require "test/unit"

class ZoleTest < Test::Unit::TestCase
  def test_new_should_create_3_players
    zole = Zole.new
    assert_equal(3, zole.players.count)
  end      
  
  
  
end