require_relative '../player'

class TestDataGenerator
  def self.create_players_without_cards
    [Player.new('Player1'), Player.new('Player2'), Player.new('Player3')]
  end

  def self.create_players_with_cards
    players = create_players_without_cards
    players.each do |player|
      player.add_card(Card.new(:Diamond, :Ace))
      player.add_card(Card.new(:Diamond, :King))
      player.add_card(Card.new(:Diamond, :Queen))
      player.add_card(Card.new(:Diamond, :Jack))
      player.add_card(Card.new(:Diamond, :Ten))
      player.add_card(Card.new(:Diamond, :Nine))
      player.add_card(Card.new(:Diamond, :Eight))
      player.add_card(Card.new(:Diamond, :Seven))
    end
  end
end
