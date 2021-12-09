class Cell
  attr_reader :row,
              :column

  def initialize(place)
    @place = place
    @ship = nil
    @fired_upon = false
  end


  # def ocean
  #   @ocean = Hash.new
  #   ('A'..'D').each do |letter|
  #     (1..4).each do |i|
  #       @ocean["#{letter}#{i}"]
  #     end
  #   end
  # end

  def coordinate
    accumulator = []
    accumulator = @place.split("")
    row = accumulator[0]
    column = accumulator[1]
    #letters are row, numbers are columns
    #method will split the name up into row/column.
    #hash.new{|h,k,v| h[k] =0}
    @place
  end

  def ship
    @ship
  end

  def empty?
    if ship == nil
      true
    else
      false
    end
  end

#---------------------- Expect rspec loop 1
  def place_ship(ship)
    #hash of cells
      @ship = ship
  end

  def fired_upon?
     # if @ship && !@fired_upon
    @ship.hit == true

  end

  def fire_upon
    @ship.hit
    @fired_upon == true
  end

  # def render
  #   #used to render the board.
  # end
end
