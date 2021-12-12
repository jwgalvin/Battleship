class Ship
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    # This method checks to see if the ship is sunk
    @health == 0
  end

  def hit
    # this decrements the health of the ship after being called
    @health -= 1
  end

end
