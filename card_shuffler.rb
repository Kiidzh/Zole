class CardShuffler
  attr_reader :cards

  def initialize(cards, &block)
    @cards = cards
    @shuffle = block || ->(c) { c.shuffle! }
  end

  def shuffle
    @shuffle.call(@cards)
  end
end
