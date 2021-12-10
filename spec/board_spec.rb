require './lib/board'
require './lib/cell'
require './lib/ship'
require 'rspec'
require 'pry'

describe Board do
  let(:board) {Board.new(4, 4)}

  describe "iteration_2" do
    it "is a board" do
      #board = Board.new(4, 4)

      expect(board).to be_instance_of(Board)
    end

    it "can list the cells in the board" do

      expect(board.cells).to eq(:board)
    end
  end
end
