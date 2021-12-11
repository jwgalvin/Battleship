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
    @place
  end

  def ship
    @ship
  end

  def empty?
    @ship == nil

  end

#---------------------- Expect rspec loop 1
  def place_ship(ship)

      @ship = ship
  end

  def fired_upon?

    @fired_upon
  end

  def fire_upon
  if !empty?
    #@ship == true
    @ship.hit
  end
  @fired_upon = true
  end

  def render(reveal = false)
    if !fired_upon? && reveal == true && !empty?
      "S"
    elsif fired_upon? == false
      "."
    elsif fired_upon? && empty?
      "M"
    elsif fired_upon? && ship.sunk? == false && empty? == false
      "H"
    else @ship.sunk?
      "X"
    end
  end
end
