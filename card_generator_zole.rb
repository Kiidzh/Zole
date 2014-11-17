require_relative 'card'

class CardGeneratorZole
  def self.generate
    cards = []
    add_common_ranks(cards)
    add_diamond_seven_to_eight(cards)
    cards
  end

  class << self
    private

    def add_common_ranks(cards)
      suits = [:Spade, :Heart, :Diamond, :Club]
      common_ranks = [:Nine, :Ten, :Jack, :Queen, :King, :Ace]

      suits.each do |suit|
        common_ranks.each do |rank|
          cards << Card.new(suit, rank)
        end
      end
    end

    def add_diamond_seven_to_eight(cards)
      cards << Card.new(:Diamond, :Seven)
      cards << Card.new(:Diamond, :Eight)
    end
  end
end
