require_relative 'player'
require_relative 'dealer'
require_relative 'turn_manager'
require_relative 'card_generator_zole'

class Zole
  attr_reader :players, :table_cards

  def self.build(players)
    Zole.new(
      players, Dealer, CardGeneratorZole.generate, TurnManager.new(players))
  end

  def initialize(players, dealer, cards, turn_manager)
    @cards = cards
    @dealer = dealer
    @table_cards = []
    @players = initialize_players(players)
    @turn_manager = turn_manager
  end

  def deal_cards
    @dealer.deal(
      cards_to_deal_out: @cards, players: @players, table_cards: @table_cards)
  end

  def become_solo(player_name)
    update_role_decision(player_name, :solo)
  end

  def pass_move(player_name)
    update_role_decision(player_name, :pass)
  end

  def put_down_card(player_name, card)
    player = get_player(player_name)
    fail 'Cannot put down more than two cards' if player.cards.count <= 8
    player.put_down_card(card)
  end

  def get_player(player_name)
    @players.find { |x| x.name == player_name }
  end

  def get_players_cards(player_name)
    player = get_player(player_name)
    player.cards
  end

  private

  def solo_player
    @players.find(&:solo?)
  end

  def update_role_decision(player, role)
    @turn_manager.validate_is_players_turn(player)
    if role == :pass
      pass_turn_for_player(player)
    elsif role == :solo
      make_player_solo(player)
    end
  end

  def initialize_players(player_names)
    players = []
    player_names.each do |player_name|
      players.push(Player.new(player_name))
    end
    players
  end

  def pass_turn_for_player(player)
    get_player(player).role = :pass
    @turn_manager.advance_move_to_next_player
  end

  def make_player_solo(player)
    assign_solo_duo_roles_for_players(player)
    add_cards_from_table_to_solo_player
  end

  def assign_solo_duo_roles_for_players(solo_player)
    @players.each do |p|
      p.role = p.name == solo_player ? :solo : :duo
    end
  end

  def add_cards_from_table_to_solo_player
    2.times { solo_player.add_card(table_cards.pop) }
  end
end
