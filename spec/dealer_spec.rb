require_relative '../dealer'
require_relative '../card_generator_zole'
require_relative '../player'

describe Dealer do

  let(:cards_to_deal_out) { CardGeneratorZole.generate }
  let(:table_cards) { [] }
  let(:players) { [Player.new('Player1'),Player.new('Player2'), Player.new('Player3')] }

  context '.deal' do
    before(:each) { Dealer.deal({cards_to_deal_out: cards_to_deal_out, players: players, table_cards: table_cards}) }

    it 'should require cards, 3 players and a table' do
    end

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
