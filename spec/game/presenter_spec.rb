require 'spec_helper'
require 'game'

describe Presenter do
  it 'converts the board to a string' do
    board = Game.new("01\n00").board
    presenter = Presenter.new(board)
    presenter.to_s.must_equal "01\n00"
  end
end
