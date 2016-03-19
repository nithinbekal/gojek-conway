
class Game
  attr_reader :cells

  def initialize(input_as_text)
    @cells = input_as_text.split("\n")
      .map { |row| row.split(//) }
  end

  def next
    Board.new(@cells).next
  end
end

class Board
  attr_reader :cells

  def initialize(cells)
    @cells = cells.map.with_index { |row, x|
      row.map.with_index { |value, y| Cell.new(x, y, value) }
    }.flatten
  end

end

class Cell < Struct.new(:x, :y, :value)
  def ==(other)
    value == other.value &&
      x == other.x &&
      y == other.y
  end

  def neighbor_coords
    [x-1, x, x+1].product([y-1, y, y+1])
      .reject { |element| element[0] == x && element[1] == y }
  end
end
