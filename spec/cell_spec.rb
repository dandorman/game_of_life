require File.expand_path(File.join(File.dirname(__FILE__), '../lib/game_of_life/cell'))

module GameOfLife
  describe Cell do
    describe "#initialize" do
      it "creates a dead cell" do
        Cell.new(double).should_not be_alive
      end
    end

    describe "#live!" do
      it "sets a cell's status to living" do
        Cell.new(double).live!.should be_alive
      end
    end

    describe "#die!" do
      it "sets a cell's status to dead" do
        Cell.new(double).die!.should_not be_alive
      end
    end

    describe "#step" do

      let(:board) { double }

      context "with a living cell" do

        let(:cell) { Cell.new(board).live! }

        it "returns a dead cell if it has less than two live neighbors" do
          board.should_receive(:neighbors_of).with(cell).and_return([])
          cell.step.should_not be_alive
        end

        it "returns a live cell if it has two or three live neighbors" do
          board.should_receive(:neighbors_of).with(cell).and_return(Array.new(3, double(:alive? => true)))
          cell.step.should be_alive
        end

        it "returns a dead cell if it has more than three live neighbors" do
          board.should_receive(:neighbors_of).with(cell).and_return(Array.new(5, double(:alive? => true)))
          cell.step.should_not be_alive
        end
      end

      context "with a dead cell" do

        let(:cell) { Cell.new(board).die! }

        it "returns a live cell if it has exactly three living neighbors" do
          board.should_receive(:neighbors_of).with(cell).and_return(Array.new(3, double(:alive? => true)))
          cell.step.should be_alive
        end

        it "returns a dead cell if it has no living neighbors" do
          board.should_receive(:neighbors_of).with(cell).and_return([])
          cell.step.should_not be_alive
        end

        it "returns a dead cell if it has more than three living neighbors" do
          board.should_receive(:neighbors_of).with(cell).and_return(Array.new(5, double(:alive? => true)) + Array.new(3, double(:alive? => nil)))
          cell.step.should_not be_alive
        end
      end
    end
  end
end
