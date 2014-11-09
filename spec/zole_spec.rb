require_relative "../zole"
require_relative "../card"
require_relative "../player"
require_relative "../dealer"

describe Zole do
  let(:player1) { 'Player1'}
  let(:player2) { 'Player2'}
  let(:player3) { 'Player3'}
  let(:cards_to_deal_out) { CardGeneratorZole.generate }

  let(:zole) {Zole.build([player1, player2, player3])}

  context '.new' do
    it 'should create 3 players' do
      expect(zole.get_player(player1)).to_not be_nil
      expect(zole.get_player(player2)).to_not be_nil
      expect(zole.get_player(player3)).to_not be_nil
    end

    it 'should set player names' do
      expect(zole.get_player(player1).name).to eq(player1)
    end

    it 'should not deal cards straight away' do
      expect(zole.get_players_cards(player1).count).to eq(0)
      expect(zole.table_cards.count).to eq(0)
    end
  end

  context '.deal_cards' do
    before(:each) { zole.deal_cards }

    it 'should assign a player 8 cards' do
      player_cards = zole.get_players_cards(player1)
      expect(player_cards.count).to eq(8)
    end

    it 'should assign each player 8 cards' do
      expect(zole.get_players_cards(player1).count).to eq(8)
      expect(zole.get_players_cards(player2).count).to eq(8)
      expect(zole.get_players_cards(player3).count).to eq(8)
    end

    it 'should deal 2 cards on the table' do
      table_cards = zole.table_cards
      expect(table_cards.count).to eq(2)
    end

    it 'should deal unique cards for each player' do
      player_cards = zole.get_players_cards(player1)
      player_cards += zole.get_players_cards(player2)
      player_cards += zole.get_players_cards(player3)
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
      zole.update_role_decision(player1, :pass)
      expect(zole.get_player(player1).role).to eq(:pass)
    end

    it 'should not be possible to make a decision for any other player' do
      expect {zole.update_role_decision(player2, :pass)}.to raise_error
    end

    it 'should be possile to make a decition after the previous player has made it' do
      zole.update_role_decision(player1, :pass)
      zole.update_role_decision(player2, :solo)
      expect(zole.get_player(player2).role).to eq(:solo)
    end

    it 'should be possible to set the role of a player to solo' do
      zole.update_role_decision(player1, :solo)
      expect(zole.get_player(player1).role).to eq(:solo)
    end

    it 'when one player choses to be solo the other players roles should be set to duo' do
      zole.update_role_decision(player1, :solo)
      expect(zole.get_player(player2).role).to eq(:duo)
      expect(zole.get_player(player3).role).to eq(:duo)
    end

    it 'should not advance the move to the next player when any player choses to be solo' do
      zole.update_role_decision(player1, :solo)
      expect {zole.update_role_decision(player2, :pass)}.to raise_error
    end

    it 'should not be possible to make a decision after player has already passed' do
      zole.update_role_decision(player1,:pass)
      expect {zole.update_role_decision(player1, :solo)}.to raise_error
    end

    it 'should not be possible to make a decision after a player has decided to be solo' do
      zole.update_role_decision(player1, :solo)
      expect {zole.update_role_decision(player1, :pass)}.to raise_error
    end
  end

  context '.make_player_solo' do
    before(:each) do
      zole.deal_cards
      zole.update_role_decision(player1,:solo)
    end

    it 'should put two additional cards in the solo players hand from the table' do
      expect(zole.get_players_cards(player1).count).to eq(10)
    end

    it 'should not leave any card on the table' do
      expect(zole.table_cards.count).to eq(0)
    end
  end
end
