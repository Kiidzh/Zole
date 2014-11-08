require_relative "../zole"
require_relative "../card"
require_relative "../player"
require_relative "../dealer"

describe Zole do
  let(:player1) { 'Player1'}
  let(:player2) { 'Player2'}
  let(:player3) { 'Player3'}
  let(:cards_to_deal_out) { CardGeneratorZole.generate }

  let(:zole) {Zole.build([:player1, :player2, :player3])}

  context '.new' do
    it 'should create 3 players' do
      expect(zole.get_player(:player1)).to_not be_nil
      expect(zole.get_player(:player2)).to_not be_nil
      expect(zole.get_player(:player3)).to_not be_nil
    end

    it 'should set player names' do
      expect(zole.get_player(:player1).name).to eq(:player1)
    end

    it 'should not deal cards straight away' do
      expect(zole.get_players_cards(:player1).count).to eq(0)
      expect(zole.table_cards.count).to eq(0)
    end
  end

  context '.deal_cards' do
    before(:each) { zole.deal_cards }

    it 'should assign a player 8 cards' do
      player_cards = zole.get_players_cards(:player1)
      expect(player_cards.count).to eq(8)
    end

    it 'should assign each player 8 cards' do
      expect(zole.get_players_cards(:player1).count).to eq(8)
      expect(zole.get_players_cards(:player2).count).to eq(8)
      expect(zole.get_players_cards(:player3).count).to eq(8)
    end

    it 'should deal 2 cards on the table' do
      table_cards = zole.table_cards
      expect(table_cards.count).to eq(2)
    end

    it 'should deal unique cards for each player' do
      player_cards = zole.get_players_cards(:player1)
      player_cards += zole.get_players_cards(:player2)
      player_cards += zole.get_players_cards(:player3)
      unique_cards = player_cards.uniq { |x| x.rank.to_s + x.suit.to_s}
      expect(unique_cards.count).to eq(24)
    end

    it 'should deal unique cards on the table' do
      unique_table_cards = zole.table_cards.uniq {|x| x.rank.to_s + x.suit.to_s }
      expect(unique_table_cards.count).to eq(2)
    end
  end

  context '.update_role_decision' do
    it 'should be possible to pass for first player' do
      zole.update_role_decision(:player1, :pass)
      expect(zole.get_player(:player1).role).to eq(:pass)
    end

    it 'should not be possible to make a decision for any other player' do
      expect {zole.update_role_decision(:player2, :pass)}.to raise_error
    end
  end
end
