class Cell
  attr_reader :ship,
              :coordinate

  def initialize(place)
    @place = place
    @ship = nil
    @fired_upon = false
    @render_me = "."
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
    @ship == nil
    # if ship == nil
    #   true
    # else
    #   false
    # end
  end

  # def rows
  #
  # end


#---------------------- Expect rspec loop 1
  def place_ship(ship)
    #hash of cells
      @ship = ship
  end

  def fired_upon?
     # if @ship && !@fired_upon
    # @ship.hit == true
    @fired_upon
  end

  def fire_upon
  if !empty?
    #@ship == true
    @ship.hit
  end
  @fired_upon = true
  end

  def render
    if @ship == nil

      if @fired_upon
        @render_me = "M"
      else
        @render_me
      end
    else
      #there is a ship
      if @fired_upon
        @render_me = "H"
      end
      @render_me
    end

  end
end
