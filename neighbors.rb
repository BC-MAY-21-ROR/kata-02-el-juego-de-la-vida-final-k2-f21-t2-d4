class Neighbors
    def initialize(width, heigth, base_grid)
        @width = width
        @heigth = heigth
        @base_grid = base_grid
    end

    def score()
        neighbors = make_empty_grid
        @width.times do |r|
          @heigth.times do |c|
            score_neighbors(r, c, neighbors)
          end
        end
        neighbors
      end

    private
    def score_neighbors(row, col, neighbors)
    (row - 1..row + 1).each do |x|
        (col - 1..col + 1).each do |y|
        neighbors[row][col] += @base_grid[x][y].status if inside?(x, y) && !((row == x) && (col == y))
        end
    end
    end

    def inside?(row, col)
        row >= 0 and row < @width and col >= 0 and col < @heigth
    end

    def make_empty_grid
    empty_grid = []
    @width.times do |x|
        empty_grid.push([])
        @heigth.times do
        empty_grid[x].push(0)
        end
    end
    empty_grid
    end
end