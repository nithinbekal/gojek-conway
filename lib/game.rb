require 'game/cell'
require 'game/board'
require 'game/presenter'

class Game
  attr_reader :board

  def initialize(text)
    cells = fetch_live_cells(text)
    x = text.split("\n").size
    y = text.split("\n").map(&:length).max
    @board = Board.new(cells, x, y)
  end

  def evolve(generations=1)
    generations.times { @board = @board.next }
    @board
  end

  private

  def fetch_live_cells(text)
    text
      .split("\n")
      .map.with_index { |row, x| cell_tuple(row, x)}
      .flatten
  end

  def cell_tuple(line_text, x_index)
    line_text
      .split(//)
      .map.with_index { |value, y| [value, y] }
      .select { |element| element[0] == '1' }
      .map { |element| Cell.new(x_index, element[1]) }
  end
end

