class TurnManager
  attr_accessor :player_to_make_a_turn

  def initialize(players)
    @players = players
    @player_to_make_a_turn = players.first
  end

  def validate_is_players_turn(player_name)
    error_message =
      "Player #{player_name} is not allowed to make a turn.
      It is player's #{@player_to_make_a_turn} turn}"
    fail error_message unless @player_to_make_a_turn.to_s == player_name.to_s
  end

  def advance_move_to_next_player
    current_index = @players.index(@player_to_make_a_turn)
    @player_to_make_a_turn = get_next_player(current_index)
  end

  def assign_move_to_first_player
    @player_to_make_a_turn = @players.first
  end

  private

  def get_next_player(current_index)
    new_index = current_index == @players.count - 1 ? 0 : current_index + 1
    @players[new_index]
  end
end
