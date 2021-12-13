require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'

class Game
  attr_reader :player_board, :computer_board, :round

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @round = 1
  end

  def main_menu
    # This is how we begin a game, can we clear the screen first?
    system "clear"
    puts "Welcome to BATTLESHIP \nEnter p to play. Enter q to quit."
    user_input = gets.chomp.downcase

    until ["p", "q"].include?(user_input)
        p "Invalid, try again."
        user_input = gets.chomp.downcase
    end
      if user_input == "p"
      p "Welcome to the Navy"
      begin_game
      elsif user_input == "q"
          p "Quitter"
      else
      end
  end

    def begin_game
      system "clear"
      directions = "You will have 2 vessels to your Fleet. \nCruiser is 3 squares. \nSubmarine is 2 squares. \nThe Game board itself is a square. Its default size is 4 x 4. \nEach turn will consist  of you, then skynet, choosing a location to fire upon.  The game will continue until you or skynet is doomed to the bottom of the digital sea. Ships must be placed in a straight line! Place your Navy wisely!!! For all Mankind!"
      computer_place

      ship_1 = Ship.new("Cruiser", 3)
      ship_2 = Ship.new("Submarine", 2)
      puts directions
      puts "#{@player_board.render(true)}"
      puts "Place your Cruiser on the Board now, it will need 3 coordinates that are in a straight line."
      ship_coords = gets.chomp.tr(",", " ").upcase!
      ship_coords = ship_coords.split(" ")
      if ship_coords == false
        puts "invalid coordinates, try again."
        ship_coords = gets.chomp.tr(",", " ").upcase!
        ship_coords = ship_coords.split(" ")
      end
      @player_board.place(ship_1, ship_coords)
      system "clear"
      puts "#{@player_board.render(true)}"
      puts "Place your Submarine on the Board now, it will need 2 coordinates that are in a straight line up or down."
      ship_coords = gets.chomp.tr(",", " ").upcase!
      ship_coords = ship_coords.split(" ")
      @player_board.place(ship_2, ship_coords)
      system "clear"
      #puts "#{turn_count}"
      puts "=====Player Board=====\n#{@player_board.render(true)}"
      puts "=====Computer Board=====\n#{@computer_board.render(true)}"
      #binding.pry
      turn
      # binding.pry
    end

  # def losing_conditions
  #   if
  #   end
  # end

  def turn
    until @player_lose || @computer_lose do
    puts "=====Round===== #{@round}"
    puts "=====Player Board=====\n#{@player_board.render(true)}"
    puts "=====Computer Board=====\n#{@computer_board.render(false)}"
    puts "Choose what coordinate to fire upon!"
    target = gets.chomp.upcase!
    @computer_board.cells[target].fire_upon#(target)
    puts "And now for skynet to fire..."
    ctarget = "#{@player_board.cells.keys.sample}"
    @player_board.cells[ctarget].fire_upon
    @player_lose = @player_board.cells[key].value("X") == 5
    @computer_lose = @computer_board.cells.values("X") == 5
      #p "Game Over. You Lose."
      #main_menup
    #elsif @computer_board.cells.values("X") == 5
      #p "Congratulations, You Win!"
      #main_menu
    #else
    #end
    @round +=1

      # until method should be used here until both ships are sunk for either player
      # computer placement will choose from ~8 choices, when a random choice is decided, a specific setup will be engaged.
      # computer shot will check to see if it has hit anything prior? selects from 8 different patterns of choice.
      # computer.choice(1..8) random do ==> 4 C1 C2 C3 C4 D1 D2
  end
  end

  def computer_place
    cship_1 = Ship.new("Ship1", 2)
    cship_2 = Ship.new("Ship name", 3)
    loop do
      @coordinates = []
      until @coordinates.length == cship_2.length do
        @coordinates << @computer_board.cells.keys.sample
      end
      if @computer_board.valid_placement?(cship_2, @coordinates)
        @computer_board.place(cship_2, @coordinates)
        break
      end
    end
    loop do
      @coordinates = []
      until @coordinates.length == cship_1.length do
        @coordinates << @computer_board.cells.keys.sample
      end
      if @computer_board.valid_placement?(cship_1, @coordinates)
        @computer_board.place(cship_1, @coordinates)
        break
      end
    end
    # coords = @computer_board[@cells.to_a.sample(3)]
  end
    # binding.pry
end
