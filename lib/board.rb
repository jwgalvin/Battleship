class Board
attr_reader :rows, :columns, :cells

  def initialize(rows = 4, columns = 4)
    @rows = rows
    @columns = columns
    @cells = {}

    @letters = "A".."D"
    @letters.to_a
    @numbers = 1..4
    @numbers.to_a
      @letters.each do |letter|
        @numbers.each do |number|
          @cells["#{letter}#{number.to_s}"] = Cell.new("#{letter}#{number.to_s}")
        end

      end

    def place(ship, coords)
      # This method places the ship in the cells passed through the parameters
      if valid_placement?(ship, coords) == true
        coords.each do |cell|
          check_coord_match = @cells.find_all do |location|
            location[1].coordinate == cell
          end
          check_coord_match.each do |place_cell|
            place_cell[1].place_ship(ship)
          end
        end
      end
    end

    def valid_location?(coords)
      #This method confirms there is a Valid location to place the ship on.
      @cells.has_key?(coords)

    end

    def is_occupied?(ship, coords)
      # @cells[coords].empty?
      #This makes sure that there is no other ship in the cells passed through
      coords.any? do |coords|
        @cells[coords].ship != nil
      end
    end

    def check_alignment_char(coords)
      # This checks that the ships placed in the same column
      letter = []
      number = []
      coords.each do |coord|
        letter << coord[0] && number << coord[1].to_i
      end
        letter.each_cons(2).all? do |letter_1, letter_2|
        letter_2.ord - letter_1.ord == 1 && number.uniq.count == 1
      end
    end

    def check_alignment_num(coords)
      # This checks that the ships placement are either same row
      letter = []
      number = []
      coords.each do |coord|
        letter << coord[0] && number << coord[1].to_i
      end
        number.each_cons(2).all? do |number_1, number_2|
        number_2 - number_1 == 1 && letter.uniq.count == 1
      end
    end

    def right_size(ship, coords)
      # This compares the ship length to the size of the array of placement.
      ship.length != coords.count
    end


    def valid_placement?(ship, coords)
      # This method will be an aggregate method that calls on other methods to confirm valid placement.

      return false if right_size(ship, coords)
      return false if is_occupied?(ship, coords)
      #return false if !valid_location?(coords)

        if check_alignment_num(coords) || check_alignment_char(coords)
        true
        else
        false
        end
    end

    def render(board = false)
      # This method renders the board.  Initially the ships are hidden until the individual cells are fired upon or reveal is called.
      return "  1 2 3 4 \nA #{@cells["A1"].render(board)} #{@cells["A2"].render(board)} #{@cells["A3"].render(board)} #{@cells["A4"].render(board)} \nB #{@cells["B1"].render(board)} #{@cells["B2"].render(board)} #{@cells["B3"].render(board)} #{@cells["B4"].render(board)} \nC #{@cells["C1"].render(board)} #{@cells["C2"].render(board)} #{@cells["C3"].render(board)} #{@cells["C4"].render(board)} \nD #{@cells["D1"].render(board)} #{@cells["D2"].render(board)} #{@cells["D3"].render(board)} #{@cells["D4"].render(board)} \n"
    end
  end
end
