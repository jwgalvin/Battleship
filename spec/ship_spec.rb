require './lib/ship'

RSpec.describe Ship do
  describe "Iteration 1" do
    it "i don't know" do
      cruiser = Ship.new("Cruiser", 3)
      #something inputed
      expect(cruiser.class).to be_instance
      expect(cruiser.name).to be_instance_of("Cruiser")
      expect(cruiser.length).to be(3)
      expect(criuser.health).to be(3)
      # expect(cruiser.sunk?).to be(false)
      # expect(cruiser.hit).to be(true)
      # expect(cruiser.health).to eq(2)
      # expect(cruiser.hit).to be(true)
      # expect(cruiser.health).to eq(1)
      # expect(cruiser.sunk?).to be(false)
      # expect(cruiser.hit).to be(true)
      # expect(cruiser.sunk?).to be(true?)
    end
  end
end
