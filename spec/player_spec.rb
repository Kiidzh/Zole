require_relative '../player'

describe Player do
  let(:player1) { 'Player1' }
  let(:player) { Player.new(:player1) }

  context '.new' do
    it 'should be able to set a name' do
      expect(player.name).to eq(:player1)
    end

    it 'should set players role in game as awaiting turn by default' do
      expect(player.role).to eq(:awaiting_turn)
    end
  end

  context '.add_card' do

    it 'returns an empty array if player has no cards' do
      expect(player.cards.count).to eq(0)
    end

    it 'is possible to add a card to the players hand' do
      player.add_card(Card.new(:Club, :Ace))
      expect(player.cards.count).to eq(1)
      expect(player.cards.first.rank).to eq(:Ace)
    end

    it 'is possible to add multiple cards to the players hand' do
      player.add_card(Card.new(:Club, :Ace))
      player.add_card(Card.new(:Club, :King))
      expect(player.cards.count).to eq(2)
    end

    it 'is not possible to modify players hand directly' do
      player.add_card(Card.new(:Club, :Ace))
      cards = player.cards
      cards << Card.new(:Club, :King)
      expect(player.cards.count).to eq(1)
    end
  end

  context '.role=' do
    it 'is able to change the role of a player' do
      player.role = :solo
      expect(player.role).to eq(:solo)
    end
  end

  context '.equal' do
    it 'is possible to compare players based their name' do
      expect(player == Player.new(:player1)).to eq(true)
    end
  end

  context '.solo?' do
    it 'returns true when player has role solo' do
      player.role = :solo
      expect(player.solo?).to eq(true)
    end

    it 'returns false when player is not solo' do
      expect(player.solo?).to eq(false)
      player.role = :duo
      expect(player.solo?).to eql(false)
    end
  end

  context '.put_down_card' do
    it 'is possible to put down a card' do
      player.add_card(Card.new(:Club, :Ace))
      player.put_down_card(Card.new(:Club, :Ace))
      expect(player.cards.count).to eq(0)
    end
  end
end
