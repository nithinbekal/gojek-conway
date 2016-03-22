require 'game/cell'
require 'game/board'

class Game
  attr_reader :cells

  def initialize(text)
    @cells = text.split("\n")
      .map.with_index { |row, x| cell_tuple(row, x)}
      .flatten
    @board = Board.new(cells)
  end

  def evolve(generations)
    generations.times { @board = @board.next }
    @board
  end

  private

  def cell_tuple(line_text, x_index)
    line_text.split(//)
      .map.with_index { |value, y| [value, y] }
      .select { |element| element[0] == '1' }
      .map { |element| Cell.new(x_index, element[1]) }
  end
end

