require_relative "card"

class Player

  attr_reader :name, :cards

  def initialize(playerName)
    @name = playerName
    @cards = []
  end

  def add_card(card)
    @cards.push(card)
  end
end
