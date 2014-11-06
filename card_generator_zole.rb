require_relative "card"

class CardGeneratorZole  
  def self.generate    
    suits = [:Spade,:Heart,:Diamond,:Club]
    common_ranks = [:Nine,:Ten,:Jack,:Queen,:King,:Ace]
    
    cards = []
    suits.each do |suit|
      common_ranks.each do |rank| 
        cards.push(Card.new(suit, rank))
      end
    end
    
    cards.push(Card.new(:Diamond, :Seven))
    cards.push(Card.new(:Diamond, :Eight))
    cards
  end    
end