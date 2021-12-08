require './lib/ship'
require 'rspec'
require 'pry'

RSpec.describe Ship do
  describe "Iteration 1" do
    it "first test" do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.name).to eq("Cruiser")
      expect(cruiser.length).to be(3)
      expect(cruiser.health).to be(3)
      expect(cruiser.sunk?).to be(false)
    end

    it "hit, new health, not sunk" do
      cruiser = Ship.new("Cruiser", 3)
      cruiser.hit
      expect(cruiser.health).to eq(2)
      expect(cruiser.sunk?).to be(false)
    end

    it "hit 2, new health, not sunk" do
      cruiser = Ship.new("Cruiser", 3)
      cruiser.hit
      cruiser.hit
      expect(cruiser.health).to eq(1)
      expect(cruiser.sunk?).to be(false)
    end

    it "hit 4, new health, Sunk return true" do
      cruiser = Ship.new("Cruiser", 3)
      cruiser.hit
      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to be(true)
    end
  end
end
