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
          cell = Cell.new("B4" )
      #expect(cruiser = Ship.new("Cruiser", 3)).to be_instance_of(Ship)
      #expect(cruiser.class).to be(Class)
      #expect(cell.place_ship(cruiser)).to be(true)
      #expect(cell.ship).to be_instance_of(Ship)
      #expect(cell.empty?).to be(false)
    end

    it "2nd expect block" do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("B4" )
      #expect(cell = Cell.new("B4")).to be_instance_of(Cell)
      #expect(cruiser = Ship.new("Cruiser", 3)).to be_instance_of(Ship)
      #expect(cell.place_ship(cruiser)).to be(true)
      #expect(cell.fired_upon?).to be(false)
      #expect(cell.fire_upon).to be(true)
      #expect(cell.ship.health).to eq(2)
      #expect(cell.fired_upon?).to be(true)
      end


  end
end
