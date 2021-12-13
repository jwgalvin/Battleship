require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'

class Game
  # attr_reader :begin_game

  def initialize
    @boards = []
    @player_board = Board.new
    @computer_board = Board.new
  end

  def main_menu
    # This is how we begin a game, can we clear the screen first?
    # reset
    puts "Welcome to BATTLESHIP \nEnter p to play. Enter q to quit."
    user_input = gets.chomp.downcase

    until ["p", "q"].include?(user_input)
        p "Invalid, try again."
        user_input = gets.chomp.downcase
    end
      if user_input == "p" #this is our main branch and idea where the game will be rendered and started.
      p "Welcome to the Navy"
      begin_game
      elsif user_input == "q"
          p "Quit"
      else

          # exit ??? can we clear the screen like we can with terminal
        # maybe later include a way to go back to main men
      end
  end

    def begin_game
      directions = "You will have 2 vessels to your Fleet. \nCruiser is 3 squares. \nSubmarine is 2 squares. \nThe Game board itself is a square. Its default size is 4 x 4. \nEach turn will consist  of you, then skynet, choosing a location to fire upon.  The game will continue until you or skynet is doomed to the bottom of the digital sea. Ships must be placed in a straight line! Place your Navy wisely!!! For all Mankind!"
      @boards = []
      boards << player_board = Board.new
      boards << computer_board = Board.new
      puts "#{boards[0].render(true)}"
      puts "Place your cruiser on the Board now, it will need 3 coordinates that are in a straight line. Please choose them one at a time."
      cruiser << get.chomp.upcase!
      #for cruiser.each  do |placement|
        #@boards[0].place(cruiser, )
        #let(:player_board) {Board.new}#(user_input, user_input)
        #let(:computer_board) {Board.new}
      #end
    end

    #def turn
      # this will dictate when the game ends as well
      # until method should be used here until both ships are sunk for either player
      # computer placement will choose from ~8 choices, when a random choice is decided, a specific setup will be engaged.
      # computer shot will check to see if it has hit anything prior? selects from 8 different patterns of choice.
      # computer.choice(1..8) random do ==> 4 C1 C2 C3 C4 D1 D2
      #
    #end
end
