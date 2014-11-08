require_relative 'player'
require_relative 'dealer'

class Zole

  attr_reader :players, :table_cards

  def self.build(players)
    Zole.new(players, Dealer, CardGeneratorZole.generate)
  end

  def initialize(players, dealer, cards)
    @cards = cards
    @dealer = dealer
    @table_cards = []

    @players = []
    players.each do |player_name|
      @players.push(Player.new(player_name))
    end
  end

  def start_match
    @dealer.deal({cards_to_deal_out: @cards, players: @players, table_cards: @table_cards} )
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
end

