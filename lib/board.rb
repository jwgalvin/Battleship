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
      @cells[coords].ship == nil
    end


    def check_alignment_order(ship, coords)
      letters = coords.map{|coordinate| coordinate[0]}
      numbers = coords.map{|coordinate| coordinate[1]}
      column_range = Range.new(letters.sort.first, letters.sort.last).count
      row_range = Range.new(numbers.sort.first, numbers.sort.last).count
      if letters.uniq.count == 1 && row_range == ship.length
        true
      elsif numbers.uniq.count == 1 && column_range == ship.length
        true
      else
        false
      end

    end

    def placed_in_order(ship, coords)
      first_position = coords.all? do |letter| letter == coords[0]
      end
      last_position = coords.last.ord == (coords.first.ord + ship.length - 1)
      if first_position && last_position
        true
      else
        false
      end

    end

    def right_size(ship, coords)
      ship.length == coords.count
    end

    def valid_placement?(ship, coords)
      if coords.all? {|coord| valid_location?(ship, coord)}
         right_size(ship,coords) && check_alignment_order(ship,coords) && placed_in_order(ship, coords)
      else
        false

      end

    end

  end

end
