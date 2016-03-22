
class Game
  attr_reader :cells

  def initialize(text)
    @cells = text.split("\n")
      .map.with_index { |row, x| cell_tuple(row, x)}
      .flatten
  end

  def next
    Board.new(@cells).next
  end

  def cell_tuple(line_text, x_index)
    line_text.split(//)
      .map.with_index { |value, y| [value, y] }
      .select { |element| element[0] == '1' }
      .map { |element| Cell.new(x_index, element[1]) }
  end
end

class Board
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def next
    Board.new(surviving_cells + resurrecting_cells)
  end

  def contains_cell?(cell)
    cells.include?(cell)
  end

  private

  def surviving_cells
    candidates_for_next_turn
      .select { |cell| alive?(cell) && has_neighbor_count?(cell, [2,3]) }
  end

  def resurrecting_cells
    candidates_for_next_turn
      .select { |cell| dead?(cell) && has_neighbor_count?(cell, [3]) }
  end

  def candidates_for_next_turn
    @cells.map(&:neighborhood).flatten.uniq
  end

  def dead?(cell)
    !alive?(cell)
  end

  def alive?(cell)
    @cells.any? { |c| c == cell }
  end

  def has_neighbor_count?(cell, range)
    range.include?(cell.neighbors_in_board(self).size)
  end
end

class Cell < Struct.new(:x, :y)
  def ==(other)
    self.x == other.x && self.y == other.y
  end

  def neighborhood
    [x-1, x, x+1].product([y-1, y, y+1])
      .map { |element| Cell.new(element[0], element[1]) }
      .reject { |cell| cell == self }
  end

  def neighbors_in_board(board)
    (neighborhood - [self]).select { |cell| board.contains_cell?(cell) }
  end
end

