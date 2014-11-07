require_relative '../player'

describe Player do
  let(:player) {Player.new('Player1')}

  context '.new' do
    it 'should be able to set a name' do
      expect(player.name).to eq('Player1')
    end
  end

  context '.add_card' do
    it 'should be possible to add a card to the players hand' do
      player.add_card(Card.new(:Club, :Ace))
      expect(player.cards.count).to eq(1)
      expect(player.cards.first.rank).to eq(:Ace)
    end

    it 'should be possible to add multiple cards to the players hand' do
      player.add_card(Card.new(:Club, :Ace))
      player.add_card(Card.new(:Club, :King))
      expect(player.cards.count).to eq(2)
    end
  end

  context '.get_cards' do
    it 'should return an empty array if player has no cards' do
      expect(player.cards.count).to eq(0)
    end
  end
end
