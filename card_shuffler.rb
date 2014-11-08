class CardShuffler

  attr_reader :cards

  def initialize(cards, &block)
    @cards = cards
    @shuffle = block || lambda {|c| c.shuffle!}
  end

  def shuffle
    @shuffle.call(@cards)
  end
end
