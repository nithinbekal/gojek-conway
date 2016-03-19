require_relative '../lib/game'
require 'spec_helper'

describe Game do
  it 'reads the input' do
    input = "01\n10"
    cells = Game.new(input).cells
    cells.must_equal [
      %w(0 1),
      %w(1 0)
    ]
  end

  # Board

  it 'loads cells correctly' do
    input = "01"
    cells = Board.new([[0,1]]).cells
    cells.must_equal [Cell.new(0, 0, 0), Cell.new(0, 1, 1)]
  end

  # Cell

  it 'calculates cell neighbor co-ordinates' do
    cell = Cell.new(2, 6, 0)
    cell.neighbor_coords.must_equal \
      [[1, 5], [1, 6], [1, 7], [2, 5], [2, 7], [3, 5], [3, 6], [3, 7]]
  end
end
