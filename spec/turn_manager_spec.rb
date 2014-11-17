require_relative '../turn_manager'
require_relative '../player'

describe TurnManager do
  let(:player1) { 'player1' }
  let(:player2) { 'player2' }
  let(:player3) { 'player3' }
  let(:players) { [player1, player2, player3] }
  let(:turn_manager) { TurnManager.new(players) }

  context '.new' do
    it 'requires to pass in an array of players' do
    end
  end

  context '.player_to_make_a_turn' do
    it 'returns the first player as the player to make the turn
        right after creation' do
      expect(turn_manager.player_to_make_a_turn).to eq(player1)
    end

    it 'is possible to set move to any player' do
      turn_manager.player_to_make_a_turn = player3
      expect(turn_manager.player_to_make_a_turn).to eq(player3)
    end

  end

  context '.validate_is_players_turn' do
    it 'does not raise an error
        when validating the first player to make a turn' do
      turn_manager.validate_is_players_turn(player1)
    end

    it 'raises an error when validating any other player to make a turn' do
      expect { turn_manager.validate_is_players_turn(player2) }.to raise_error
      expect { turn_manager.validate_is_players_turn(player3) }.to raise_error
    end
  end

  context '.advance_turn_to_next_player' do
    it 'is possible to advance turn to the second player' do
      turn_manager.advance_move_to_next_player
      expect(turn_manager.player_to_make_a_turn).to eq(player2)
    end

    it 'loops around to first player when advancing move after third player' do
      turn_manager.advance_move_to_next_player
      turn_manager.advance_move_to_next_player
      turn_manager.advance_move_to_next_player
      expect(turn_manager.player_to_make_a_turn).to eq(player1)
    end
  end

  context '.assign_move_to_first_player' do
    it 'is possible to override next move to first player' do
      turn_manager.advance_move_to_next_player
      turn_manager.assign_move_to_first_player
      expect(turn_manager.player_to_make_a_turn).to eq(player1)
    end
  end
end
