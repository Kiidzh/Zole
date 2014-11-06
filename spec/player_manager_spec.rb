require_relative "../player_manager"
require_relative "../player"

describe PlayerManager do
  let(:player_manager) { PlayerManager.new('Player1', 'Player2', 'Player3')}
  
  context '.new' do
    it 'should create 3 players' do 
      expect(player_manager.get_player('Player1')).to_not be_nil
      expect(player_manager.get_player('Player2')).to_not be_nil
      expect(player_manager.get_player('Player3')).to_not be_nil
    end   
  end
    
  context '.get_player' do
    it 'should return a player' do 
      player = player_manager.get_player('Player1')
      expect(player).to_not be_nil
      expect(player.name).to eq('Player1')
    end 
  end
  
  context '.add_player_card' do
    it 'should add a card to players hand' do
      player_manager.add_card(Card.new(:Club, :Ace),'Player1')
      cards = player_manager.get_players_cards('Player1')
      expect(cards.count).to eq(1)
    end  
  end    

  context '.get_players_cards' do
    it 'should return players cards' do
      player_manager.add_card(Card.new(:Club,:Ace), 'Player1')
      cards = player_manager.get_players_cards('Player1')
      expect(cards.count).to eq(1)
      expect(cards.first.rank).to eq(:Ace)
      expect(cards.first.suit).to eq(:Club)
    end
  end
end