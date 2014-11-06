require_relative "../zole"
require_relative "../card"
require_relative "../player"
require_relative "../player_manager"

describe Zole do
  let(:zole) {Zole.new('Player1', 'Player2', 'Player3')}
  
  context '.new' do
    it 'should create 3 players' do
      expect(zole.get_player('Player1')).to_not be_nil
      expect(zole.get_player('Player2')).to_not be_nil
      expect(zole.get_player('Player3')).to_not be_nil
    end
    
    it 'should set player names' do
      expect(zole.get_player('Player1').name).to eq('Player1')
    end
    
    it 'should assign a player 8 cards' do
      player_cards = zole.get_players_cards('Player1')
      expect(player_cards.count).to eq(8)
    end
  end
end