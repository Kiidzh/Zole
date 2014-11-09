require_relative 'player'
require_relative 'dealer'
require_relative 'turn_manager'
require_relative 'card_generator_zole'

class Zole

  attr_reader :players, :table_cards

  def self.build(players)
    Zole.new(players, Dealer, CardGeneratorZole.generate, TurnManager.new(players))
  end

  def initialize(players, dealer, cards, turn_manager)
    @cards = cards
    @dealer = dealer
    @table_cards = []
    @players = initialize_players(players)
    @turn_manager = turn_manager
  end

  def deal_cards
    @dealer.deal({cards_to_deal_out: @cards, players: @players, table_cards: @table_cards} )
  end

  def update_role_decision(player, role)
    @turn_manager.validate_is_players_turn(player)
    update_players_role(player, role)
  end

  def get_player(player_name)
    find_player(player_name)
  end

  def get_players_cards(player_name)
    player = find_player(player_name)
    player.cards
  end

  def get_table_cards
    table_cards
  end

  private
    def find_player(player_name)
      players.find{ |x| x.name == player_name }
    end

    def solo_player
      players.find { |x| x.is_solo? }
    end

    def update_players_role(player, role)
      if role == :pass
        pass_turn_for_player(player)
      elsif role == :solo
        make_player_solo(player)
      else
        raise "role #{role} not supported. supported roles are #{:pass} and #{:solo}"
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
      find_player(player).set_role(:pass)
      @turn_manager.advance_move_to_next_player
    end

    def make_player_solo(player)
      players.each do |p|
        p.set_role(p.name == player ? :solo : :duo)
      end

      2.times { solo_player.add_card(table_cards.pop) }
    end
end
