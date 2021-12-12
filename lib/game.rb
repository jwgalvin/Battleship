require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'

class Game
  #attr_reader :navy_placement
  #def initialize(new_game)
  #  @new_game = new_game
  #end

  def main_menu
    puts "Welcome to BATTLESHIP \n Enter p to play. Enter q to quit."
    return "Welcome to BATTLESHIP \n Enter p to play. Enter q to quit."
    user_input
  end

  def setup
    user_input = gets.chomp

    if user_input == "p" #this is our main branch and idea where the game will be rendered and started.
      p "Welcome to the Navy"
      new
    elsif user_input == "q"
      p "Quit"
    else
      p "Invalid"
    end

    def begin_game
      prints "You will have 2 vessels to your Fleet. A CruiserklLorem ipsum oloseontg. Put the instructions to the game here"
      board = Board.new(4, 4)#(user_input, user_input)

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
