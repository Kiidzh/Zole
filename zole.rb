require_relative "player"
require_relative "player_manager"

class Zole
   
   def run_game
     player1 = "Player1"
     player2 = "Player2"
     player3 = "Player3"
     
     @player_manager = PlayerManager.new(player1, player2, player3)
          
   end
   
  def initialize(player1, player2, player3)
    @player_manager = PlayerManager.new(player1, player2, player3)
    
    for i in 1..8
      @player_manager.add_card(Card.new("S", "A"), player1 )
      @player_manager.add_card(Card.new("S", "A"), player2 )
      @player_manager.add_card(Card.new("S", "A"), player3 )
    end    
  end
  
  def get_player(player_name)
    @player_manager.get_player(player_name)
  end  
  
  def get_players_cards(player_name)
    @player_manager.get_players_cards(player_name)
  end
end

