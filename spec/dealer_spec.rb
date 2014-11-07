require_relative '../dealer'
require_relative '../deck'
require_relative '../card_generator_zole'
require_relative '../player'

describe Dealer do

  let(:cards_to_deal_out) { CardGeneratorZole.generate }
  let(:table_cards) { [] }
  let(:players) { [Player.new('Player1'),Player.new('Player2'), Player.new('Player3')] }
  let(:dealer) { Dealer.new({cards_to_deal_out: cards_to_deal_out, players: players, table_cards: table_cards }) }

  context '.new' do
    it 'should require cards to deal out, 3 players and a table' do
    end

    it 'should keep references to players' do
      expect(dealer.players).to_not be_nil
    end

    it 'should keep reference to table_cards' do
      expect(dealer.table_cards).to_not be_nil
    end
  end

  context '.deal' do
    before(:each) { dealer.deal }
    it 'should deal out 8 cards to each player' do
      expect(players[0].cards.count).to eq(8)
      expect(players[1].cards.count).to eq(8)
      expect(players[2].cards.count).to eq(8)
    end

    it 'should deal out 2 cards on the table' do
      expect(table_cards.count).to eq(2)
    end

    it 'should deal out all cards' do
      expect(cards_to_deal_out.count).to eq(0)
    end
  end
end
