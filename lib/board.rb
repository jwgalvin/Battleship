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

    def valid_location?(ship, coords)
      #should confirm there are not any other ships in the cell prior to placing
      coords.all?  do |cell|
        @cells[cell].ship == nil
      end
    end


    def check_alignment_char(coords)
      # This should check the check that the ships placed in the same column
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
      # This should check the check that the ships placement are either same row
      letter = []
      number = []
      coords.each do |coord|
        letter << coord[0] && number << coord[1].to_i
      end
        number.each_cons(2).all? do |number_1, number_2|
        number_2 - number_1 == 1 && letter.uniq.count == 1
      end
    end




    # def placed_in_order(ship, coords)
    #   # this should be confirming the ship are only placed in consecutive order. I don't know how to get each_cons to work for it.
    #   first_position = coords.all? do |letter| letter == coords[0]
    #   end
    #   last_position = coords.last.ord == (coords.first.ord + ship.length - 1)
    #   if first_position && last_position
    #     true
    #   else
    #     false
    #   end
    # end


    def right_size(ship, coords)
      #this compares the ship length to the size of the array of placement.
      ship.length != coords.count
    end

    def valid_placement?(ship, coords)
      return false if right_size(ship, coords)

      if check_alignment_num(coords) || check_alignment_char(coords)
        true
      else
        false

      end

    end

  end

end
