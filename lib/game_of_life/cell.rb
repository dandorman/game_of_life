module GameOfLife
  class Cell
    def initialize(board)
      @board = board
      @alive = false
    end

    def alive?
      @alive
    end

    def live!
      @alive = true
      self
    end

    def die!
      @alive = false
      self
    end

    def step
      self.class.new(@board).tap do |cell|
        if underpopulated? or overcrowded?
          cell.die!
        elsif alive? or sexy_times?
          cell.live!
        end
      end
    end

    private

    def neighbors
      @neighbors ||= @board.neighbors_of(self)
    end

    def living_neighbors
      @living_neighbors ||= neighbors.select(&:alive?)
    end

    def underpopulated?
      alive? && living_neighbors.count < 2
    end

    def overcrowded?
      alive? && living_neighbors.count > 3
    end

    def sexy_times?
      !alive? && living_neighbors.count == 3
    end
  end
end
