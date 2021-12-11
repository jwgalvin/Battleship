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


    def check_alignment(ship, coords)
      letters = coords.map{|coordinate| coordinate[0]}
      numbers = coords.map{|coordinate| coordinate[1]}
      column_range = Range.new(letters.sort.first, letters.sort.last).count
      row_range = Range.new(numbers.sort.first, numbers.sort.last).count
      # column_check = true
      # row_check = true
      if letters.uniq.count == 1 && row_range == ship.length
        true
      elsif numbers.uniq.count == 1 && column_range == ship.length
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
        right_size(ship,coords) && check_alignment
      else
        false

      end
    end
  end
end
