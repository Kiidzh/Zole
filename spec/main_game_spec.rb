require_relative '../main_game'
require_relative '../player'
require_relative 'test_data_generator'

describe MainGame do
  let(:players) { TestDataGenerator.create_players_with_cards }
  let(:player1) { players[0]}
  let(:player2) { players[1]}
  let(:player3) { players[2]}
  let(:main_game) { MainGame.new(players) }

  context '.build' do
    it 'should require players to be passed in' do
      MainGame.build(players)
    end
  end

  context '.play_card' do
    it 'should allow the first player to play a card' do
      main_game = MainGame.build(players)
      main_game.play_card(player1, player1.cards[0])
    end

    it 'shoud remove the played card from the players hand' do
      main_game = MainGame.build(players)
      main_game.play_card(player1, player1.cards[0])
      expect(player1.cards.count).to eq(7)
    end

    it 'should not allow any other player to play a card before the first player' do
      main_game = MainGame.build(players)
      expect { main_game.play_card(player2, player2.cards[0]) }.to raise_error
    end

    it 'should be possible to play only a card that the player has' do
      main_game = MainGame.build(players)
      card_not_in_hand = Card.new(:Heart, :Ace)
      expect { main_game.play_card(player1, card_not_in_hand) }.to raise_error
    end

    it 'should be possible for the next player to play a card after the first player has played one' do
      main_game = MainGame.build(players)
      main_game.play_card(player1, player1.cards[0])
      main_game.play_card(player2, player2.cards[0])
    end
  end
end
