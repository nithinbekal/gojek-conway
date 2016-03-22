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

