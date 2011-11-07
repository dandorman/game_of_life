Given /^the game board looks like this:$/ do |table|
  @board = GameOfLife::Board.new(table.raw.first.length, table.raw.length)
  table.raw.each_with_index do |symbols, row|
    symbols.each_with_index do |symbol, column|
      @board[row, column].live! if symbol == '#'
    end
  end
end

When /^the game advances$/ do
  @board.step!
end

Then /^the game board should look like this:$/ do |table|
  table.raw.each_with_index do |symbols, row|
    symbols.each_with_index do |symbol, column|
      if symbol == '#'
        @board[row, column].should be_alive
      else
        @board[row, column].should_not be_alive
      end
    end
  end
end
