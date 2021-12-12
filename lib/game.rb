require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'

class Game
  # attr_reader
  #def initialize(new_game)
  #  @new_game = new_game
  #end

  def start
    #p "This statement"
    return "Welcome to BATTLESHIP \n Enter p to play. Enter q to quit."
    #user_input = gets.chomp

    #if user_input == "p" #this is our main branch and idea where the game will be rendered and started.
      # game.new
      #p "New game"
    #elsif user_input == "q"
      #p "Quit"
    #else
      #p "Invalid"
    #end
  end

  def user_input
    user_input = gets.chomp

    if user_input == "p" #this is our main branch and idea where the game will be rendered and started.
      # game.new
      p "New game"
    elsif user_input == "q"
      p "Quit"
    else
      p "Invalid"
    end
  end
end
