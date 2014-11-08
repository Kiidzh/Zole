require_relative '../turn_manager'
require_relative '../player'

describe TurnManager do
  let(:player1){'player1'}
  let(:player2){'player2'}
  let(:player3){'player3'}
  let(:players) { [:player1, :player2, :player3]}
  let(:turn_manger) {TurnManager.new(players)}

  context '.new' do
    it 'should require to pass in an array of players' do
    end
  end

  context '.player_to_make_a_turn' do
    it 'should return the first player as the player to make the turn right after creation' do
      expect(turn_manger.player_to_make_a_turn).to eq(:player1)
    end
  end

  context '.validate_allowed_turn' do
    it 'should not raise an error when validating the first player to make a turn' do
      turn_manger.validate_allowed_turn(player1)
    end

    it 'should raise an error when validating any other player to make a turn' do
      expect {turn_manger.validate_allowed_turn(player2)}.to raise_error
      expect {turn_manger.validate_allowed_turn(player3)}.to raise_error
    end
  end

  context '.advance_turn_to_next_player' do
    it 'should be possible to advance turn to the second player' do
      turn_manger.advance_move_to_next_player
      expect(turn_manger.player_to_make_a_turn).to eq(:player2)
    end
  end
end
