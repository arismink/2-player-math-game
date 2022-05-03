require './player'
require './game'

# declare players
player1 = Player.new('P1')
player2 = Player.new('P2')

# initialize game
newGame = Game.new(player1, player2)

# call the game method that runs the game 
newGame.run_game

