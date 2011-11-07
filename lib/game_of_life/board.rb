require 'matrix'

module GameOfLife
  class Board
    def initialize(row_size, column_size, &block)
      block ||= -> i, j { Cell.new(self) }
      @board = Matrix.build(row_size, column_size, &block)
    end

    def step!
      @board = Matrix.build(@board.row_size, @board.column_size) do |row, column|
        @board[row, column].step
      end
    end

    def neighbors_of(cell)
      [].tap do |neighbors|
        @board.index(cell).tap do |cell_row, cell_column|
          ([cell_row - 1, 0].max..[cell_row + 1, @board.row_size - 1].min).each do |row|
            ([cell_column - 1, 0].max..[cell_column + 1, @board.column_size - 1].min).each do |column|
              neighbors << @board[row, column] unless row == cell_row and column == cell_column
            end
          end
        end
      end
    end

    def [](row, column)
      @board[row, column]
    end
  end
end
