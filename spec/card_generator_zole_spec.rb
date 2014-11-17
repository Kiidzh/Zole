require_relative '../card_generator_zole'
require_relative '../card'

describe CardGeneratorZole do
  let(:cards) { CardGeneratorZole.generate }

  context '.generate' do
    it 'generates 26 cards' do
      expect(cards.count).to eq(26)
    end

    it 'generates 7 of diamonds' do
      expect(cards.find { |x| x.suit == :Diamond && x.rank == :Seven })
        .to_not be_nil
    end

    it 'generates 8 of diamonds' do
      expect(cards.find { |x| x.suit == :Diamond && x.rank == :Eight })
        .to_not be_nil
    end

    it 'generates 6 spades' do
      expect(cards.find_all { |x| x.suit == :Spade }.count).to eq(6)
    end

    it 'generates 4 queens' do
      expect(cards.find_all { |x| x.rank == :Queen }.count).to eq(4)
    end
  end
end
