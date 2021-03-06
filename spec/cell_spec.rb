require './lib/ship'
require './lib/cell'
require 'rspec'
require 'pry'

describe Cell do
  describe "iteration_1" do
    it "first expect block" do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("B4")
      expect(cell).to be_instance_of(Cell)
      expect(cell.coordinate).to eq("B4")
      expect(cell.ship).to be_nil
      expect(cell.empty?).to be(true)

    end

    it "2nd expect block" do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("B4")
      cell.place_ship(cruiser)
      expect(cruiser.class).to be(Ship)
      expect(cell.ship).to eq(cruiser)
      expect(cell.empty?).to be(false)
      expect(cell.ship.health).to eq(3)
    end

    it "3rd expect block" do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("B4")
      cell.place_ship(cruiser)
      expect(cell.empty?).to be(false)
      expect(cell.fired_upon?).to be(false)
      expect(cell.ship.health).to eq(3)
      end

      it "fire_upon test block" do
        cruiser = Ship.new("Cruiser", 3)
        cell = Cell.new("B4")
        cell.place_ship(cruiser)
        cell.fire_upon
        expect(cell.ship.health).to be(2)
        #binding.pry
        #binding.pry
        expect(cell.fired_upon?).to be(true)
      end

      it "Render method" do
        cell_1 = Cell.new("B4")
        expect(cell_1.render).to eq(".")
        cell_1.fire_upon
        expect(cell_1.render).to eq("M")
      end

    it "Render method_2" do
      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
      expect(cell_2.render).to eq(".")
      cell_2.render(true)
      expect(cell_2.render(true)).to eq("S")
      cell_2.fire_upon
      expect(cell_2.render).to eq("H")
      expect(cruiser.sunk?).to be(false)
      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to be(true)
      #binding.pry
      expect(cell_2.render).to eq("X")
    end
  end
end
