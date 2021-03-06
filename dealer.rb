class Dealer
  def self.deal(args)
    cards_to_deal_out = args[:cards_to_deal_out]
    players = args[:players]
    table_cards = args[:table_cards]

    players.each do |player|
      deal_8_cards_to_player(cards_to_deal_out, player)
    end
    deal_2_cards_on_table(cards_to_deal_out, table_cards)
  end

  class << self
    private

    def deal_8_cards_to_player(cards_to_deal_out, player)
      8.times do
        player.add_card(cards_to_deal_out.pop)
      end
    end

    def deal_2_cards_on_table(cards_to_deal_out, table_cards)
      table_cards << cards_to_deal_out.pop
      table_cards << cards_to_deal_out.pop
    end
  end
end
