require_relative "../card_generator_zole"
require_relative "../card"

describe CardGeneratorZole do
  let(:cards) { CardGeneratorZole.generate }
  
  context '.generate' do
    it 'should generate 26 cards' do
      expect(cards.count).to eq(26)
    end
    
    it 'should generate 7 of diamonds' do
      expect(cards.find {|x| x.suit == :Diamond and x.rank == :Seven}).to_not be_nil
    end    
    
    it 'should generate 8 of diamonds' do
      expect(cards.find {|x| x.suit == :Diamond and x.rank == :Eight}).to_not be_nil
    end   
     
    it 'should generate 6 spades' do
      expect(cards.find_all {|x| x.suit == :Spade }.count ).to eq(6)
    end
    
     it 'should generate 4 queens' do
      expect(cards.find_all {|x| x.rank == :Queen}.count ).to eq(4)
    end
  end
end