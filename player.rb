require_relative "card"

class Player

  attr_reader :name, :cards, :role

  def initialize(playerName)
    @name = playerName
    @cards = []
    @role = :awaiting_turn
  end

  def add_card(card)
    @cards.push(card)
  end

  def set_role(role)
    @role = role
  end

  def ==(other)
    @name == other.name
  end
end
