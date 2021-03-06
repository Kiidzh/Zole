require_relative '../card_shuffler'
require_relative '../card'

describe CardShuffler do

  let(:cards) { [Card.new(:Club, :Ace), Card.new(:Heart, :Queen)] }

  context '.new' do

    let(:card_shuffler) { CardShuffler.new(cards) { |cards| cards.reverse! } }

    it 'keeps an instance of deck' do
      expect(card_shuffler.cards).to_not be_nil
    end

    it 'does not shuffle cards right away' do
      expect(card_shuffler.cards.first.suit).to eq(:Club)
    end

    it 'shuffles cards using the passed in algorithm' do
      card_shuffler.shuffle
      expect(card_shuffler.cards.first.suit).to eq(:Heart)
    end

    it 'works even when we do not pass in an code block' do
      card_shuffler = CardShuffler.new(cards)
      card_shuffler.shuffle
    end
  end
end
