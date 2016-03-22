require_relative '../lib/game'
require 'spec_helper'

describe Game do
  it 'reads the input' do
    input = "01\n10"
    cells = Game.new(input).cells
    cells.must_equal [ Cell.new(0, 1), Cell.new(1, 0) ]
  end
end

describe Board do
  it 'generates the next state' do
    c11 = Cell.new(1, 1)
    c12 = Cell.new(1, 2)
    c21 = Cell.new(2, 1)
    c22 = Cell.new(2, 2)
    result = Board.new([c11, c21, c22]).next.cells

    [c11, c12, c21, c22].each { |cell| result.must_include cell }
  end
end

describe Cell do
  it 'calculates cell neighbor co-ordinates' do
    cell = Cell.new(2, 6)
    coords = [[1, 5], [1, 6], [1, 7], [2, 5],
              [2, 7], [3, 5], [3, 6], [3, 7]]
    cell.neighborhood.must_equal \
      coords.map { |c| Cell.new(c[0], c[1]) }
  end
end
