require_relative '../lib/game'
require 'spec_helper'

describe Game do
  it 'reads the input' do
    input = "01\n10"
    cells = Game.new(input).cells
    cells.must_equal [ Cell.new(0, 1), Cell.new(1, 0) ]
  end

  it 'generates the next state' do
    game = Game.new("0000\n0100\n0110\n0000")
    expected = Game.new("0000\n0110\n0110\n0000")
    expected.cells.must_equal(game.next.cells)
  end
end

describe Cell do
  it 'calculates cell neighbor co-ordinates' do
    cell = Cell.new(2, 6)
    coords = [[1, 5], [1, 6], [1, 7], [2, 5], [2, 6], [2, 7], [3, 5], [3, 6], [3, 7]]
    cell.neighborhood.must_equal \
      coords.map { |c| Cell.new(c[0], c[1]) }
  end
end
