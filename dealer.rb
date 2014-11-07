class Dealer
  attr_reader :players, :table_cards

  def initialize(args)
    @cards_to_deal_out = args[:cards_to_deal_out]
    @players = args[:players]
    @table_cards = args[:table_cards]
  end

  def deal
    @players.each do |player|
      deal_8_cards_to_player(player)
    end
    deal_2_cards_on_table
  end

  private
    def deal_8_cards_to_player(player)
      for i in 1..8 do
        player.add_card(@cards_to_deal_out.pop)
      end
    end

    def deal_2_cards_on_table
      @table_cards.push(@cards_to_deal_out.pop)
      @table_cards.push(@cards_to_deal_out.pop)
    end
end
