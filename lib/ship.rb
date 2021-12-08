class Ship
  attr_reader :name, :length

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def health
    @health
  end

  def sunk?
    #boolean with health comparison when 0 returns true
    if @health == 0
      true
    else
      false
    end
  end

  def hit
    #boolean with comparison to cell location
    @health -= 1
  end

end
