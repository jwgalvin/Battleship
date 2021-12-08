class Ship
  attr_reader :name, :length

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def health
    #health counter starting at length that decrements to 0
  end

  def sunk?
    #boolean with health comparison when 0 returns true
  end

  def hit
    #boolean with comparison to cell location
  end

end
