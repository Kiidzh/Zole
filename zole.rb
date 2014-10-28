require_relative "player"
class Zole
  def players
    return [Player.new("Player1"), Player.new("Player2"), Player.new("Player3")]
  end
end

