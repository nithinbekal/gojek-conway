class Board
  attr_reader :cells, :x, :y

  def initialize(cells, x=1, y=1)
    @cells = cells
    @x, @y = x, y
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

