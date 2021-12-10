class Board
attr_reader :rows, :columns, :cells

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @cells = {}
    letters = "A".."D"
    letters.to_a
    numbers = 1..4
    numbers.to_a

    letters.each do |letter|
      numbers.each do |number|
        @cells["#{letter}#{number.to_s}"] = Cell.new("#{letter}#{number.to_s}")
      end
    end
  end

# hash.new{|h,k,v|} h[k] = 0
  # board.new{|rows, columns|} rows[columns] = 0
  # def cells
  #   board.each do |board|
  #     @cells <<
  #   rows = Range.new(1, @rows)
  #   columns = Range.new("A", @columns)
  # end

end
