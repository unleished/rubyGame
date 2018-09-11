class Player
  attr_reader :name, :life
  attr_writer :life

  def initialize(name, life = 3)
    @name = name
    @life = life
  end

  def lose_life
    @life -= 1
  end

  def dead?
    @life < 1
  end

end
