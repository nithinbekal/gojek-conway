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


  it 'loads correctly' do
    input = "01"
    cells = Board.new([[0,1]]).cells
    cells.must_equal [Cell.new(0, 0, 0), Cell.new(0, 1, 1)]
  end

end
