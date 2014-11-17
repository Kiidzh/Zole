require_relative '../card'

describe Card do
  context '.eql?' do
    it 'considers cards with the same rank and suit to be equal' do
      card1 = Card.new(:Diamond, :Ace)
      card2 = Card.new(:Diamond, :Ace)
      expect(card1 == card2).to eq(true)
    end

    it 'considers different suits to not be equal cards' do
      card1 = Card.new(:Diamond, :Ace)
      card2 = Card.new(:Spade, :Ace)
      expect(card1 == card2).to eq(false)
    end

    it 'considers different ranks to not be equal cards' do
      card1 = Card.new(:Spade, :King)
      card2 = Card.new(:Spade, :Ace)
      expect(card1 == card2).to eq(false)
    end

    it 'works on eql? operator as well' do
      card1 = Card.new(:Spade, :Ace)
      card2 = Card.new(:Spade, :Ace)
      expect(card1.eql? card2).to eq(true)
    end
  end
  context '.to_s' do
    it 'is possible to print out a card' do
      card = Card.new(:Diamond, :Ace)
      expect(card.to_s).to eq('Diamond Ace')
    end
  end
end
