class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def ==(other)
    are_equal(other)
  end

  def eql?(other)
    are_equal(other)
  end

  def to_s
    "#{@suit} #{@rank}"
  end

  private

  def are_equal(other)
    result = ((@suit == other.suit) && (@rank == other.rank))
    result
  end
end
