require './question'

class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def run_game
    turns = 1
    
    # loop that runs the game until a player no longer has lives
    while @current_player.has_life
      puts "---- TURN: #{turns} ----"

      # every turn, needs to initialize a new question
      @new_question = Question.new

      puts @new_question.generate_question(@current_player)
      print "> "
      player_input = $stdin.gets.chomp.to_i

      # get the user input and pass it to check answer
      puts self.eval_answer(player_input)

      # do not continue forward if current player has zero lives. display results immediately
      break if @current_player.lives == 0 

      # display game stat at end of each turn
      print "SCORE: "
      puts self.game_stat
        
      # switch_players at end of turn
      self.switch_player

      # add to turn counter
      turns += 1
    end

    self.end_game

  end

  def eval_answer(input)
    if @new_question.check_answer(input)
      return "#{@current_player.name}: YES! You are correct."

    else
      @current_player.lose_life
      return "#{@current_player.name}: Wrong! Correct answer is: #{@new_question.answer}"

    end
  end

  def end_game
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
    # displays player vs player & lives
    "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def find_winner
    # return winning player
    @player1.lives > @player2.lives ? @player1 : @player2
  end

  def print_winner
    winner = self.find_winner

    "#{winner.name} wins with a score of #{winner.lives}/3"
  end

end