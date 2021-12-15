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
    puts "######
#     #   ##   ##### ##### #      ######  ####  #    # # #####
#     #  #  #    #     #   #      #      #      #    # # #    #
######  #    #   #     #   #      #####   ####  ###### # #    #
#     # ######   #     #   #      #           # #    # # #####
#     # #    #   #     #   #      #      #    # #    # # #
######  #    #   #     #   ###### ######  ####  #    # # #      "
sleep(1)
    puts " "
    puts "Welcome to BATTLESHIP \nEnter p to play. Enter q to quit."
    user_input = gets.chomp.downcase

    until ["p", "q"].include?(user_input)
        p "Invalid puny flesh person, try again."
        user_input = gets.chomp.downcase
    end
      if user_input == "p"
      p "Welcome to the the future war meat puppet!"
      sleep(2)
      begin_game
      elsif user_input == "q"
          p "Quitter"
          sleep(4)
          system "quit"
      else
      end
  end

    def begin_game
      system "clear"
      directions = "You will have 2 vessels in your Fleet. \n \nA Cruiser is 3 squares. \n \nA Submarine is 2 squares. \n \nThe Game board is 4 x 4. \n \nEach turn will consist of you, then skynet, choosing a location to fire upon.  \n \nThe game will continue until you or skynet is doomed to the bottom of the digital sea. \n \nShips must be placed in consecutive, order ie) a1 a2 a3 or a1 b1 c1. \n \nPlace your Fleet wisely!!! For humanity's fate is upon your shoulders!!"
      sleep(2)

      computer_place # calls on the computer place its pieces on the board.

      # Below this block is the text for the player to place their ships
      @ship_1 = Ship.new("Cruiser", 3)
      @ship_2 = Ship.new("Submarine", 2)
      puts directions
      puts "#{@player_board.render(true)}"
      puts "Place your Cruiser now, it will need 3 coordinates that are left to right or top to bottom"
      sleep(1)
      loop do
        ship_coords = gets.chomp.tr(",", " ").upcase!
        ship_coords = ship_coords.split(" ")
        if  @player_board.valid_placement?(@ship_1, ship_coords)
            @player_board.place(@ship_1, ship_coords)
            break
        else
            puts "invalid coordinates, follow the direction meat puppet and try again."
            sleep(1)
        end
      end

      puts "#{@player_board.render(true)}"
      puts "Place your Submarine now, it will need 2 coordinates that are left to right or top to bottom."
      sleep(1)
      loop do
        ship_coords = gets.chomp.tr(",", " ").upcase!
        ship_coords = ship_coords.split(" ")
        if @player_board.valid_placement?(@ship_2, ship_coords)
           @player_board.place(@ship_2, ship_coords)
           break
        else
          puts "invalid coordinates, follow the direction meat puppet and try again."
          sleep(1)
        end
      end
      system"clear"
      turn
    end

  # This method handles the player firing results.  Inside the Turn method contains the script letting the player know they fired upon a location more than once.
  def player_shoots(target)
    puts "You fire at #{target}! \n \n"
    sleep(1)
    if @computer_board.valid_location?(target) && @computer_board.cells[target].fired_upon? == false
      puts "Fwooooooosh!!! \n \n"
      sleep(1)
      @computer_board.cells[target].fire_upon
      if @computer_board.cells[target].fired_upon? && @computer_board.cells[target].empty?
        puts "LOUD SPLASHING NOISES!!!\n \n"
        sleep(1)
      elsif @computer_board.cells[target].fired_upon? && @computer_board.cells[target].ship.sunk? == false
        puts "Kaboom! Robotic wailing sings in your ears! \n \n"
        sleep(1)
      elsif @cship_1.sunk? || @cship_2.sunk?
        puts "KaKRASHBOOOOM!!! Their craft explodes!\n \n"
        sleep(1)
      end
    elsif @computer_board.valid_location?(target) == false
      puts "You can't fire there! Try Again!"
      sleep(1)
      target = gets.chomp.upcase!
      player_shoots(target)
    end
  end

  #This method handles the computer firing. It is not intelligent, but will not fire upon the same location 2x.
  def computer_shoots(ctarget)
    @computer_targeting.delete(ctarget)
    puts "Skynet fires upon #{ctarget}!!!"
    sleep(1)
    if @player_board.valid_location?(ctarget) && @player_board.cells[ctarget].fired_upon? == false
      puts "Fwooooooosh!!! ie Missle NOISES! \n \n"
      sleep(1)
      @player_board.cells[ctarget].fire_upon
      if @player_board.cells[ctarget].fired_upon? && @player_board.cells[ctarget].empty?
        puts "LOUD SPLASHING NOISES!!! \n \n"
        sleep(1)
      elsif @player_board.cells[ctarget].fired_upon? && @player_board.cells[ctarget].ship.sunk? == false
        puts "Kaboom! The wails of hurt and dying fill your ears... \n \n"
        sleep(1)
      elsif @ship_1.sunk? || @ship_2.sunk?
        puts "KaKRASHBOOOOM!!! More explodey, very traumatic sounds! \n \n"
        sleep(1)
      end
    elsif @computer_board.valid_location?(target) == false
    end
  end

  # This is where the game takes place.  It references player_shoots and computer_shoots alongside other class methods.  Our backlog for improvements includes adding computer/player_lose methods.  Currently the code is the block inside turn.
  def turn
    prior_target = []
    puts "The boards will record whether you hit 'H', miss 'S' or sunk 'X' their craft.  Use this to annhilate the robotic hoard."
    until @player_lose || @computer_lose do
    puts "===== Round#{@round} ====="
    puts "===== Your Board =====\n#{@player_board.render(true)}"
    puts " "
    puts "===== Skynet's Board =====\n#{@computer_board.render(false)}"
    puts " "
    puts "Choose what coordinate to fire upon!"
    target = gets.chomp.upcase!
    if prior_target.include? target
      puts "YOU FOOL, YOU'VE ALREADY FIRED UPON THAT LOCATION!!! Skynet rejoices at your wasted opportunity! \n \n"
      sleep(1)
    end
    player_shoots(target)
    prior_target << target
    puts "And now for Skynet to fire... \n \n"
    sleep(1)
    ctarget =  "#{@computer_targeting.sample}"
    computer_shoots(ctarget)
    @round +=1

    #This informs the player they lost a ship in case they are blind.
    if @ship_1.sunk? || @ship_2.sunk?
      puts "You lost a Vessel! It's crew has been atomized!"
      sleep(1)
    end

    # This is the player loses condition
    if @ship_1.sunk? && @ship_2.sunk?
      @player_lose = true
      puts "#     # ####### #     #
 #   #  #     # #     #
  # #   #     # #     #
   #    #     # #     #
   #    #     # #     #
   #    #     # #     #
   #    #######  #####

#       #######  #####  #######
#       #     # #     # #
#       #     # #       #
#       #     #  #####  #####
#       #     #       # #
#       #     # #     # #
####### #######  #####  ####### "
      puts " "
      puts " #####     #    #     # #######
#     #   # #   ##   ## #
#        #   #  # # # # #
#  #### #     # #  #  # #####
#     # ####### #     # #
#     # #     # #     # #
 #####  #     # #     # #######

####### #     # ####### ######
#     # #     # #       #     #
#     # #     # #       #     #
#     # #     # #####   ######
#     #  #   #  #       #   #
#     #   # #   #       #    #
#######    #    ####### #     # "
      puts " "
      sleep(1)
      puts "You lost this round. Play again? (p/q)"
      user_input = gets.chomp.downcase
      until ["p", "q"].include?(user_input)
        p "Invalid, try again."
        user_input = gets.chomp.downcase
      end
        if user_input == "p"
        p "Welcome back to the the future war!"
        system "clear"
        begin_game
        elsif user_input == "q"
            p "Without the Conners fighting for humanity the species was doomed!!"
            system "quit"
        else
        end
#   This is the Computer loses condition
    elsif @cship_1.sunk? && @cship_2.sunk?
      @computer_lose = true
      puts "#     # ####### #     #
 #   #  #     # #     #
  # #   #     # #     #
   #    #     # #     #
   #    #     # #     #
   #    #     # #     #
   #    #######  #####

#     # ### #     #
#  #  #  #  ##    #
#  #  #  #  # #   #
#  #  #  #  #  #  #
#  #  #  #  #   # #
#  #  #  #  #    ##
 ## ##  ### #     # "
      puts " "
      puts " #####     #    #     # #######
#     #   # #   ##   ## #
#        #   #  # # # # #
#  #### #     # #  #  # #####
#     # ####### #     # #
#     # #     # #     # #
 #####  #     # #     # #######

####### #     # ####### ######
#     # #     # #       #     #
#     # #     # #       #     #
#     # #     # #####   ######
#     #  #   #  #       #   #
#     #   # #   #       #    #
#######    #    ####### #     # "
      puts " "
      sleep(2)
      puts "You are victorious! Now go replenish the human race! \n \nDo you wish to fight Skynet once more? (p/q)"
      user_input = gets.chomp.downcase
      until ["p", "q"].include?(user_input)
          p "Invalid, try again."
          user_input = gets.chomp.downcase
      end
        if user_input == "p"
        p "Welcome to the the future war!"
        sleep(1)
        system "clear"
        begin_game
        elsif user_input == "q"
            p "what about the multiverse???!! There other realities that need you!"
            sleep(1)
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
