require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'

class Game
  attr_reader :player_board, :computer_board, :round

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @round = 1
    @computer_targeting = @player_board
    @human_targeting = @computer_board
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
      p "Welcome to the the future war!"
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

      @ship_1 = Ship.new("Cruiser", 3)
      @ship_2 = Ship.new("Submarine", 2)
      puts directions
      puts "#{@player_board.render(true)}"
      puts "Place your Cruiser on the Board now, it will need 3 coordinates that are in a straight line."
      loop do
        ship_coords = gets.chomp.tr(",", " ").upcase!
        ship_coords = ship_coords.split(" ")
        if  @player_board.valid_placement?(@ship_1, ship_coords)
            @player_board.place(@ship_1, ship_coords)
            break
        else
            puts "invalid coordinates, try again."
        end
      end

      puts "#{@player_board.render(true)}"
      puts "Place your Submarine on the Board now, it will need 2 coordinates that are in a straight line up or down."
      loop do
        ship_coords = gets.chomp.tr(",", " ").upcase!
        ship_coords = ship_coords.split(" ")
        if @player_board.valid_placement?(@ship_2, ship_coords)
           @player_board.place(@ship_2, ship_coords)
           break
        else
          puts "invalid coordinates, try again."
        end
      end

      system "clear"
      #puts "#{turn_count}"
      puts "=====Player Board=====\n#{@player_board.render(true)}"
      puts "=====Computer Board=====\n#{@computer_board.render(true)}"
      #binding.pry
      turn
      # binding.pry
    end


  def turn
    until @player_lose || @computer_lose do
    puts "=====Round===== #{@round}"
    puts "=====Player Board=====\n#{@player_board.render(true)}"
    puts "=====Computer Board=====\n#{@computer_board.render(false)}"
    puts "Choose what coordinate to fire upon!"
    target = gets.chomp.upcase!
    @computer_board.cells[target].fire_upon
    puts "And now for skynet to fire..."
    ctarget =  "#{@player_board.cells.keys.sample}"
    puts "skynet fires upon #{ctarget}!!!"
    @player_board.cells[ctarget].fire_upon

    @round +=1

    if @ship_1.sunk? || @ship_2.sunk?
      puts "You lost a ship, it was sunk!"
    end

    if @ship_1.sunk? && @ship_2.sunk?

      @player_lose = true

      puts "You lost this round. Play again?"
      user_input = gets.chomp.downcase
      until ["p", "q"].include?(user_input)
        p "Invalid, try again."
        user_input = gets.chomp.downcase
      end


        if user_input == "p"
        p "Welcome to the the future war!"
        begin_game
        elsif user_input == "q"
            p "Without the conners humanity was overrun."
        else
        end

    elsif @cship_1.sunk? && @cship_2.sunk?
      @computer_lose = true
      puts "You are victorious! Now go replenish the human race! \nDo you wish to fight skynet once more?"
      user_input = gets.chomp.downcase

      until ["p", "q"].include?(user_input)
          p "Invalid, try again."
          user_input = gets.chomp.downcase
      end
        if user_input == "p"
        p "Welcome to the the future war!"
        begin_game
        elsif user_input == "q"
            p "what about the multiverse, other realities need conners!"
        else
        end

    else
      puts "No one is the victor yet!"
    end
  end
  end

  def computer_place
    @cship_1 = Ship.new("Ship1", 2)
    @cship_2 = Ship.new("Ship name", 3)
    loop do
      @coordinates = []
      until @coordinates.length == @cship_2.length do
        @coordinates << @computer_board.cells.keys.sample
      end
      if @computer_board.valid_placement?(@cship_2, @coordinates)
        @computer_board.place(@cship_2, @coordinates)
        break
      end
    end
    loop do
      @coordinates = []
      until @coordinates.length == @cship_1.length do
        @coordinates << @computer_board.cells.keys.sample
      end
      if @computer_board.valid_placement?(@cship_1, @coordinates)
        @computer_board.place(@cship_1, @coordinates)
        break
      end
    end
    # coords = @computer_board[@cells.to_a.sample(3)]
  end
    # binding.pry
end
