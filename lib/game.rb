require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'

class Game
  attr_reader :player_board, :computer_board, :round

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @round = 1
    @computer_targeting = @player_board.cells.keys
    @human_targeting = @computer_board.cells.keys
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
          system "quit"
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

      turn

    end

  def player_shoots(target)
    puts "You fire at #{target}! \n \n"
    if @computer_board.valid_location?(target) && @computer_board.cells[target].fired_upon? == false
      puts "Fwooooooosh!!! \n \n"
      @computer_board.cells[target].fire_upon
      if @computer_board.cells[target].fired_upon? && @computer_board.cells[target].empty?
        puts "LOUD SPLASHING NOISES!!!\n \n"
      elsif @computer_board.cells[target].fired_upon? && @computer_board.cells[target].ship.sunk? == false
        puts "Kaboom! \n \n"
      elsif @cship_1.sunk? || @cship_2.sunk?
        puts "KaKRASHBOOOOM!!! Their craft explodes!\n \n"
      end
    elsif @computer_board.valid_location?(target) == false
      puts "You can't fire there! Try Again!"
      target = gets.chomp.upcase!
      player_shoots(target)
    end
  end

  def computer_shoots(ctarget)
    @computer_targeting.delete(ctarget)
    puts "skynet fires upon #{ctarget}!!!"
    if @player_board.valid_location?(ctarget) && @player_board.cells[ctarget].fired_upon? == false
      puts "Fwooooooosh!!! ie Missle NOISES! \n \n"
      @player_board.cells[ctarget].fire_upon
      if @player_board.cells[ctarget].fired_upon? && @player_board.cells[ctarget].empty?
        puts "LOUD SPLASHING NOISES!!! \n \n"
      elsif @player_board.cells[ctarget].fired_upon? && @player_board.cells[ctarget].ship.sunk? == false
        puts "Kaboom! \n \n"
      elsif @ship_1.sunk? || @ship_2.sunk?
        puts "KaKRASHBOOOOM!!! \n \n"
      end
    elsif @computer_board.valid_location?(target) == false
    end
  end

  def turn
    until @player_lose || @computer_lose do
    puts "=====Round===== #{@round}"
    puts "=====Player Board=====\n#{@player_board.render(true)}"
    puts "=====Computer Board=====\n#{@computer_board.render(false)}"
    puts "Choose what coordinate to fire upon!"
    target = gets.chomp.upcase!
    player_shoots(target)

    puts "And now for skynet to fire... \n \n"
    ctarget =  "#{@computer_targeting.sample}"
    computer_shoots(ctarget)
    @round +=1

    if @ship_1.sunk? || @ship_2.sunk?
      puts "You lost a Vessel! It's crew has been atomized!"
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
        p "Welcome back to the the future war!"
        clear_board
        begin_game
        elsif user_input == "q"
            p "Without the Conners fighting for humanity the species was doomed!!"
            system "quit"
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
            p "what about the multiverse???!! There other realities that need conners!"
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
  end
end
