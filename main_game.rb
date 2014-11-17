require_relative 'turn_manager'

class MainGame
  def self.build(players)
    player_names = players.map(&:name)
    MainGame.new(players, TurnManager.new(player_names))
  end

  def initialize(players, turn_manager)
    @players = players
    @turn_manager = turn_manager
  end

  def play_card(player, card)
    @turn_manager.validate_is_players_turn(player.name)
    player.play_card(card)
    @turn_manager.advance_move_to_next_player
  end

  def current_player
    @turn_manager.player_to_make_a_turn
  end
end
