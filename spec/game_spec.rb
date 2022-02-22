# frozen_string_literal: true

require 'rspec'
require_relative '../cell'
require_relative '../grid'
require_relative '../neighbors'
require_relative '../game'

describe Game do
  grid = Grid.new(4, 8)
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
  neighbors = Neighbors.new(4, 8, grid.cells)
  game = Game.new
  game.base_grid = grid
  game.neighbors_grid = neighbors

  it 'check ' do
    game.next_generation
    second_gen = []
    grid.cells.size.times do |x|
      second_gen.push([])
      grid.cells[0].size.times do |y|
        second_gen[x].push(grid.cells[x][y].status)
      end
    end
    expect(second_gen).to eq([[0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 1, 0, 0, 0], [0, 0, 0, 1, 1, 0, 0, 0],
                              [0, 0, 0, 0, 0, 0, 0, 0]])
  end
end
