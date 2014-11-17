require_relative '../dealer'
require_relative '../card_generator_zole'
require_relative '../player'

describe Dealer do

  let(:cards_to_deal_out) { CardGeneratorZole.generate }
  let(:table_cards) { [] }
  let(:players) { [Player.new('P1'), Player.new('P2'), Player.new('P3')] }

  context '.deal' do
    before(:each) do
      Dealer.deal(
        cards_to_deal_out: cards_to_deal_out,
        players: players,
        table_cards: table_cards)
    end

    it 'requires cards, 3 players and a table' do
    end

    it 'deals out 8 cards to each player' do
      expect(players[0].cards.count).to eq(8)
      expect(players[1].cards.count).to eq(8)
      expect(players[2].cards.count).to eq(8)
    end

    it 'deals out 2 cards on the table' do
      expect(table_cards.count).to eq(2)
    end

    it 'deals out all cards' do
      expect(cards_to_deal_out.count).to eq(0)
    end
  end
end
