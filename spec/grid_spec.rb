require 'rspec'
require_relative '../cell.rb'
require_relative '../grid.rb'
require_relative '../neighbors.rb'

describe Grid do
  grid = Grid.new(4,8)

  it 'Has a x value greater than 0' do
    expect(grid.width).to be > 0
  end

  it 'Has a y value greater than 0' do
    expect(grid.heigth).to be > 0
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