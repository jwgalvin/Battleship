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
      expect(game.main_menu).to eq("Welcome to BATTLESHIP \n Enter p to play. Enter q to quit.")
    end

    it 'will render a blank board' do
      #@user_input = gets.chomp -- need to figure out how to test chomp
      #@user_input = "p"
      #binding.pry
      expect(game.begin_game).to be_a(Array)
      expect(game.begin_game[0].render).to eq "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
      game.begin_game[0].place(cruiser, ["A1", "A2", "A3"])
      expect(game.begin_game[0].place(cruiser, ["A1", "A2", "A3"]))
      #expect(game.begin_game)
    end

    #it 'will decline invalid user input' do
      #@user_input = "j"

      #expect(@user_input).to eq("Invalid")
    #end
  end
end
