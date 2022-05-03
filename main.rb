require './player'
require './game'
require './question'

player1 = Player.new('P1')
player2 = Player.new('P2')


newGame = Game.new(player1, player2)
# call the game method that runs the game 

newGame.run_game

