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
      ##  no return in TTD expect(cell.place_ship(cruiser)).to be(true)
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
    end
  end
