require './lib/game.rb'
require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'
require 'rspec'
require 'pry'

describe Game do
  let(:game) {Game.new}
  let(:cruiser) {Ship.new("cruiser", 3)}
  let(:submarine) {Ship.new("submarine", 2)}

  describe 'iteration_3 game spec' do
    it 'Will welcome the new  player' do
      expect(game).to be_a(Game)
    end

    it 'will render a blank boards' do

      expect(game.player_board).to be_a(Board)
      expect(game.computer_board).to be_a(Board)
      expect(game.computer_board.render).to eq"  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
      expect(game.player_board.render).to eq "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    end

    it 'will run place player ships and reveal player board' do
    game.player_board.place(cruiser, ["A1", "A2", "A3"])
    expect(game.player_board.render(true)).to eq "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
    game.player_board.place(submarine, ["B1", "B2"])
    expect(game.player_board.render(true)).to eq "  1 2 3 4 \nA S S S . \nB S S . . \nC . . . . \nD . . . . \n"
    end

    it "will place computer ships but not reveal their location." do
      game.computer_board.place(cruiser, ["A1", "A2", "A3"])
      game.computer_board.place(submarine, ["B1", "B2"])
      expect(game.computer_board.render(false)).to eq "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    end

    it "will show hit or miss markers on the boards" do
      game.player_board.place(cruiser, ["A1", "A2", "A3"])
      game.player_board.place(submarine, ["B1", "B2"])
      game.player_board.cells["A1"].fire_upon
      expect(game.player_board.render(true)).to eq "  1 2 3 4 \nA H S S . \nB S S . . \nC . . . . \nD . . . . \n"
      game.player_board.cells["A2"].fire_upon
      game.player_board.cells["A4"].fire_upon
      expect(game.player_board.render(true)).to eq "  1 2 3 4 \nA H H S M \nB S S . . \nC . . . . \nD . . . . \n"
      game.player_board.cells["A3"].fire_upon
      expect(game.player_board.render(true)).to eq "  1 2 3 4 \nA X X X M \nB S S . . \nC . . . . \nD . . . . \n"
    end

  end
end
