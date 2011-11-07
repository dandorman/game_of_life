require File.expand_path(File.join(File.dirname(__FILE__), '../lib/game_of_life/board'))

module GameOfLife
  describe Board do
    describe "#neighbors_of" do
      subject do
        counter = 0
        Board.new(3, 3) { |i, j| counter += 1 }
      end

      it "returns an array of the cells around the given cell" do
        subject.neighbors_of(5).should == [1, 2, 3, 4, 6, 7, 8, 9]
      end

      {
        "top-left"     => {cell: 1, neighbors: [2, 4, 5]},
        "top-right"    => {cell: 3, neighbors: [2, 5, 6]},
        "bottom-right" => {cell: 9, neighbors: [5, 6, 8]},
        "bottom-left"  => {cell: 7, neighbors: [4, 5, 8]}
      }.each do |corner, data|
        it "works in the #{corner} corner" do
          subject.neighbors_of(data[:cell]).should == data[:neighbors]
        end
      end
    end
  end
end
