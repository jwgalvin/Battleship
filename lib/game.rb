require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'

class Game
  # attr_reader :begin_game

  #def initialize
    #@player_board = player_board
    #@computer_board = computer_board
  #end
  def begin_game
    directions = "You will have 2 vessels to your Fleet. \nCruiser is 3 squares. \nSubmarine is 2 squares"
    boards = []
    boards << player_board = Board.new
    boards << computer_board = Board.new
    #let(:player_board) {Board.new}#(user_input, user_input)
    #let(:computer_board) {Board.new}
  end

  def main_menu
    # This is how we begin a game
    puts "Welcome to BATTLESHIP \n Enter p to play. Enter q to quit."
    return "Welcome to BATTLESHIP \n Enter p to play. Enter q to quit."
    @user_input = gets.chomp

      if @user_input == "p" #this is our main branch and idea where the game will be rendered and started.
        p "Welcome to the Navy"
        begin_game
      elsif user_input == "q"
        p "Quit"
        exit
      # maybe later include a way to go back to main menu
      else user_input != "p" || "q"
        p "Invalid"
        "invalid"
      end

    def turn
      # this will dictate when the game ends as well
      # until method should be used here until both ships are sunk for either player
      # computer placement will choose from ~8 choices, when a random choice is decided, a specific setup will be engaged.
      # computer shot will check to see if it has hit anything prior? selects from 8 different patterns of choice.
      # computer.choice(1..8) random do ==> 4 C1 C2 C3 C4 D1 D2
      #
    end
  end
end
