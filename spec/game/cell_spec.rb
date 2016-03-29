require 'spec_helper'
require 'game/cell'

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
