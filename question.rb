class Question
  attr_reader :answer

  def initialize
    @rand1 = randNum_gen
    @rand2 = randNum_gen
    @answer = @rand1 + @rand2
  end

  # generate a random number between 1 - 20 inclusively
  def randNum_gen
    rand(1..20)
  end

  def generate_question(player)
    "#{player.name}: What does #{@rand1} plus #{@rand2} equal?"
  end

  def check_answer(player_input)
    # check the user input and compare if it equals the answer
    player_input == @answer ? true : false
  end


end