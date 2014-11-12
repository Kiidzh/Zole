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
    validate_role_already_set(role)
    @role = role
  end

  def is_solo?
    @role == :solo
  end

  def ==(other)
    @name == other.name
  end

  private
    def validate_role_already_set(role)
      not_allowed_to_change_roles = [:solo, :duo]
      error_message = "It is not possible to set player's #{@name} role to #{role}. Role already set to #{@role}"
      raise error_message if not_allowed_to_change_roles.include? @role
    end
end
