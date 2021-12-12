require './lib/game.rb'
require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'
require 'rspec'
require 'pry'

describe Game do
  let(:game) {Game.new}

  describe 'iteration_3 game spec' do
    it 'Will welcome the new  player' do
# binding.pry
      expect(game).to be_a(Game)
      expect(game.start).to eq("Welcome to BATTLESHIP \n Enter p to play. Enter q to quit.")

    end

    xit 'will take user input' do

      expect(user_input).to be("p")
    end
  end
end
