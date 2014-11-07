require_relative '../deck'
require_relative '../card_generator_zole'

describe Deck do

  let(:deck) {  create_deck_with_two_cards }

  context '.top_card' do
    it 'returns the top card' do
      expect(deck.top_card).to_not be_nil
      expect(deck.top_card.rank).to eq(:Seven)
      expect(deck.top_card.suit).to eq(:Diamond)
    end
    it 'should not change the deck size' do
      deck.top_card
      expect(deck.count).to eq(2)
    end
  end

  context '.remove_top_card' do
    it 'should remove a card from the deck' do
      deck.remove_top_card
      expect(deck.count).to eq(1)
    end
    it 'should remove the top card from the deck' do
      top_card = deck.top_card
      deck.remove_top_card

      expect(deck).to_not include(top_card)
    end
  end

  context '.each' do
    it 'should support enumerable methods' do
      card = deck.find { |x| x.rank == :Seven }
      expect(card).to_not be_nil
    end
  end
end

def create_deck_with_two_cards
  cards = [Card.new(:Diamond, :Seven), Card.new(:Diamond, :Eight)]
  dummy_two_card_generator = double('CardGeneratorZole', :generate => cards)
  Deck.new(dummy_two_card_generator)
end
