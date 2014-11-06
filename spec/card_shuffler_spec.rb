require_relative '../card_shuffler'

describe CardShuffler do
  let(:deck) { double(:Deck) }
  
  context '.new' do
    it 'should keep in instance of deck' do
      card_shuffler = CardShuffler.new(deck)
      expect(card_shuffler.deck).to_not be_nil
    end  
    
    
    
  end  
end


#test_card_shuffler_should_have_an_instance_of_an_deck
#test_new_should_not_shuffle_cards_immidiately