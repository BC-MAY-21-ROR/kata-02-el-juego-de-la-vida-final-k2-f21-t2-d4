require 'rspec'
require_relative '../cell.rb'
require_relative '../grid.rb'
require_relative '../neighbors.rb'

describe Neighbors do
  grid = Grid.new(4,8)
  # [[0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 1, 0, 0, 0],[0, 0, 0, 1, 1, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0]]
  # Set all the cells with 0
  grid.cells.size.times do |x|
    grid.cells[0].size.times do |y|
      grid.cells[x][y].status = 0
    end
  end
  grid.cells[1][4].status = 1
  grid.cells[2][3].status = 1
  grid.cells[2][4].status = 1
  neighbors = Neighbors.new(4,8,grid.cells)
  
  it 'check score method' do
      sum = 0
      neighbors.score.flatten.each {|num| sum += num}
      expect(sum).to eq 24
  end  
end

# 0 0 0 0 0 0 0 0 
# 0 0 0 0 1 0 0 0 
# 0 0 0 1 1 0 0 0 
# 0 0 0 0 0 0 0 0 

# 0 0 0 1 1 1 0 0 3
# 0 0 1 3 2 2 0 0 8
# 0 0 1 2 2 2 0 0 7
# 0 0 1 2 2 1 0 0 6