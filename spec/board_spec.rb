require './lib/board'
require './lib/cell'
require './lib/ship'
require 'rspec'
require 'pry'

describe Board do
  let(:board) {Board.new(4, 4)}
  let(:cruiser) {Ship.new("Cruiser", 3)}
  let(:submarine) {Ship.new("Submarine", 2)}

  describe "iteration_2 setup board" do
    it "is a board" do
      #board = Board.new(4, 4)

      expect(board).to be_instance_of(Board)
    end

    it "can list the cells in the board" do

      expect(board.cells).to eq(board)
    end
  end

  describe "iteration_2 validating placement" do
    it "has ships" do

      expect(Ship.new("Cruiser", 3)).to be_a(Ship)
      expect(Ship.new("Submarine", 2)).to be_a(Ship)
    end

    it "is checked for valid placement" do

      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be(false)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to be(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to be(false)
    end

    it "is not place diagonally" do

      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to be(false)
    end

    it "is placed correctly" do

      expect(board.valid_placement?(submarine, ["A1", "A2"])).to be(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be(true)
    end
  end

  describe "Iteration 2 Tools for Validation" do
    it "places ships correctly" do
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(cell_1).to be_a(Cell)
      expect(cell_2).to be_a(Cell)
      expect(cell_3).to be_a(Cell)
      expect(cell_1.ship).to be_a(Ship)
      expect(cell_2.ship).to be_a(Ship)
      expect(cell_3.ship).to be_a(Ship)
      expect(cell_3.ship == cell_2.ship).to be(true)
    end

    it "checks for overlapping ships" do
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.valid_placement?(submarine, ["A1", "B1"])).to be(false)
    end
  end
end
