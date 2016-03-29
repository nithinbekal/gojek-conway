class Presenter
  def initialize(board)
    @board = board
  end

  def to_s
    board.x.times.map { |x|
      board.y.times.map { |y| alive?(x, y) ? '1' : '0' }.join('')
    }.join("\n")
  end

  private

  attr_reader :board

  def alive?(x, y)
    board.cells.include?(Cell.new(x, y))
  end
end
