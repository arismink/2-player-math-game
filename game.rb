require './question'

class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def run_game
    turns = 1
    # # loop that runs the game until a player no longer has lives
    while @current_player.has_life
      puts "---- TURN: #{turns} ----"
      correct = false

      # every turn, needs to initialize a new question
      new_question = Question.new

      puts new_question.generate_question(@current_player)
      print "> "
      player_input = $stdin.gets.chomp.to_i

      # get the user input and pass it to check answer
      if new_question.check_answer(player_input)
        correct = true
        puts "#{@current_player.name}: YES! You are correct."

      else
        correct = false
        @current_player.lose_life
        puts "#{@current_player.name}: Seriously? No!"

      end

      break if @current_player.lives === 0 

      # display game stat at each turn
      print "SCORE: "
      puts self.game_stat
        
      # call switch_player
      self.switch_player

      #this also tracks if the end of game
      turns += 1
    end

    puts '----- GAME OVER -----'

    puts self.print_winner
    puts 'Better luck next time. Good bye!'


  end

  def switch_player
    # change current player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end

    @current_player
  end

  def game_stat
    # gets called every turn
    # displays player vs player & lives
    "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def find_winner
    @player1.lives > @player2.lives ? @player1 : @player2
  end

  def print_winner
    winner = find_winner

    "#{winner.name} wins with a score of #{winner.lives}/3"
  end

end