class Player
  attr_accessor :lives, :name

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

  # check if player still has lives
  def has_life
    lives > 0 ? true : false
  end


end