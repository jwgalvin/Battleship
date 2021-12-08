class Cell
  attr_reader :length,
              :width,
              :hit

  def initialize(length, width)
    @length = length
    @width = width
    @hit = hit
  end

  def ship
    @ship
  end

  def empty?
    #boolean
  end

  def coordinate
    #call length and width
  end

  def place_ship
    #array of cells
  end

  def fire_upon
    #input of cell location
  end

  def fire_upon?

  end

  def ship.health
    #length - fire_upon values
  end

  def render
    #used to render the board.
  end
end
