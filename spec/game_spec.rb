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
  def c(x, y)
    Cell.new(x, y)
  end

  it 'generates the next state' do
    board = Board.new([c(1, 1), c(2,1), c(2,2)])
    result = board.next.cells
    cells = [c(1, 1), c(1,2), c(2,1), c(2,2)]
    cells.each { |cell| result.must_include cell }
  end

  it 'retains state for block' do
    board = Board.new([c(1, 1), c(1,2), c(2,1), c(2,2)])
    result = board.next.cells
    cells = [c(1, 1), c(1,2), c(2,1), c(2,2)]
    cells.each { |cell| result.must_include cell }
  end

  it 'evolves into a blinker' do
    board = Board.new([ c(1,0), c(1,1), c(1,2) ])
    result = board.next.cells
    cells = [ c(0,1), c(1,1), c(2,1) ]
    cells.each { |cell| result.must_include cell }
  end
end

describe Cell do
  it 'calculates cell neighbor co-ordinates' do
    cell = Cell.new(2, 6)
    neighbors = cell.neighborhood
    coords = [[1, 5], [1, 6], [1, 7], [2, 5],
              [2, 7], [3, 5], [3, 6], [3, 7]]

    coords.each do |c|
      neighbors.must_include Cell.new(c[0], c[1])
    end
  end
end
