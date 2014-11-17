require_relative '../zole'
require_relative '../card'
require_relative '../player'
require_relative '../dealer'

describe Zole do
  let(:player1) { 'Player1' }
  let(:player2) { 'Player2' }
  let(:player3) { 'Player3' }
  let(:cards_to_deal_out) { CardGeneratorZole.generate }

  let(:zole) { Zole.build([player1, player2, player3]) }

  context '.new' do
    it 'creates 3 players' do
      expect(zole.get_player(player1)).to_not be_nil
      expect(zole.get_player(player2)).to_not be_nil
      expect(zole.get_player(player3)).to_not be_nil
    end

    it 'sets player names' do
      expect(zole.get_player(player1).name).to eq(player1)
    end

    it 'does not deal cards straight away' do
      expect(zole.get_players_cards(player1).count).to eq(0)
      expect(zole.table_cards.count).to eq(0)
    end
  end

  context '.deal_cards' do
    before(:each) { zole.deal_cards }

    it 'assigns a player 8 cards' do
      player_cards = zole.get_players_cards(player1)
      expect(player_cards.count).to eq(8)
    end

    it 'assigns each player 8 cards' do
      expect(zole.get_players_cards(player1).count).to eq(8)
      expect(zole.get_players_cards(player2).count).to eq(8)
      expect(zole.get_players_cards(player3).count).to eq(8)
    end

    it 'deals 2 cards on the table' do
      expect(zole.table_cards.count).to eq(2)
    end

    it 'deals unique cards for each player' do
      player_cards = zole.get_players_cards(player1)
      player_cards += zole.get_players_cards(player2)
      player_cards += zole.get_players_cards(player3)
      unique_cards = player_cards.uniq { |x| x.rank.to_s + x.suit.to_s }
      expect(unique_cards.count).to eq(24)
    end

    it 'deals unique cards on the table' do
      unique_table_cards =
        zole.table_cards.uniq { |x| x.rank.to_s + x.suit.to_s }
      expect(unique_table_cards.count).to eq(2)
    end
  end

  context '.pass_move' do
    it 'is possible to pass for first player' do
      zole.pass_move(player1)
      expect(zole.get_player(player1).role).to eq(:pass)
    end

    it 'is not possible to make a decision for any other player' do
      expect { zole.pass_move(player2) }.to raise_error
    end

    it 'is possile to make a decition after the previous player has made it' do
      zole.pass_move(player1)
      zole.pass_move(player2)
      expect(zole.get_player(player2).role).to eq(:pass)
    end

    it 'is not be possible to make a decision
        after player has already passed' do
      zole.pass_move(player1)
      expect { zole.become_solo(player1) }.to raise_error
    end
  end

  context '.become_solo' do
    before(:each) do
      zole.deal_cards
      zole.become_solo(player1)
    end

    it 'is possible to set the become solo' do
      expect(zole.get_player(player1).role).to eq(:solo)
    end

    it 'sets other player roles to duo when one player chooses to be solo' do
      expect(zole.get_player(player2).role).to eq(:duo)
      expect(zole.get_player(player3).role).to eq(:duo)
    end

    it 'does not advance the move to the next player
        when any player choses to be solo' do
      expect { zole.pass_move(player2) }.to raise_error
    end

    it 'is not possible to make a decision
        after a player has decided to be solo' do
      expect { zole.pass_move(player1) }.to raise_error
    end

    it 'puts two additional cards in
        the solo players hand from the table' do
      expect(zole.get_players_cards(player1).count).to eq(10)
    end

    it 'does not leave any card on the table' do
      expect(zole.table_cards.count).to eq(0)
    end
  end

  context '.put_down_card' do
    before(:each) do
      zole.deal_cards
      zole.become_solo(player1)
    end

    it 'is possible to put down two cards for the solo player' do
      zole.put_down_card(player1, zole.get_players_cards(player1)[0])
      zole.put_down_card(player1, zole.get_players_cards(player1)[0])
      expect(zole.get_players_cards(player1).count).to eq(8)
    end

    it 'is possbile to put down a card only for the solo player' do
      expect { zole.put_down_card(player2) }.to raise_error
    end

    it 'is possible to only put down 2 cards' do
      get_card = proc { zole.get_players_cards(player1)[0] }

      zole.put_down_card(player1, get_card.call)
      zole.put_down_card(player1, get_card.call)
      expect { zole.put_down_card(player1, get_card.call) }.to raise_error
    end
  end
end
