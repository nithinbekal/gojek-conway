require 'spec_helper'
require 'game'

describe Game do
  it 'reads the input' do
    input = "01\n10"
    board = Game.new(input).board
    board.cells.must_equal [ Cell.new(0, 1), Cell.new(1, 0) ]
    board.x.must_equal 2
    board.y.must_equal 2
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

