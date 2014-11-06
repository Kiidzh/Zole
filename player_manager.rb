class PlayerManager
    
  def initialize(*playerNames)
    @players = []
    playerNames.each { |playerName| @players.push(Player.new(playerName))}
  end  
  
  def get_player(player_name)
    return get_player_by_name(player_name)
  end
  
  def get_players_cards(player_name)
    return get_player_by_name(player_name).get_cards
  end
  
  def add_card(card, player_name)
    get_player_by_name(player_name).add_card(card)
  end
  
  def get_player_by_name(name)
    return @players.find { |x| x.name == name }
  end
    
end