class Cell
  attr_reader :ship,
              :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    # checks the value of the cell regarding if a ship has been placed
    @ship == nil
  end

  def place_ship(ship)
    #places the ship into the cell
      @ship = ship
  end

  def fired_upon?
    # checks if the cell has been fired_upon
    @fired_upon
  end

  def fire_upon
    #changes the cells value to reflect fired upon, has an effect on ship health.
    if !empty?
      @ship.hit
    elsif empty?
      puts "A miss! \n"
    end
    @fired_upon = true
  end

  def render(reveal = false)
    # This will keep ship hidden unlse reveal is flipped to true.  Once fired_upon it will render a character indicated below.
    if !fired_upon? && reveal == true && !empty?
      "S"
    elsif fired_upon? == false
      "."
    elsif fired_upon? == true && empty?
      "M"
    elsif fired_upon? && ship.sunk? == false && empty? == false
      "H"
    else @ship.sunk?
      "X"
    end
  end
end
