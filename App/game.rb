# frozen_string_literal: true

require './App/grid'
require './App/neighbors'

# Clase principal hace que esta wea funcione
class Game
  attr_accessor :base_grid, :neighbors_grid

  def initialize
    @gen = 0
  end

  def next_generation
    count_neighbors = @neighbors_grid.score
    @base_grid.cells.size.times do |x|
      @base_grid.cells[x].size.times do |y|
        if count_neighbors[x][y] < 2 || count_neighbors[x][y] > 3
          @base_grid.cells[x][y].status = 0
        elsif count_neighbors[x][y] == 3
          @base_grid.cells[x][y].status = 1
        end
      end
    end
  end

  def main_loop
    show_generation
    loop { gets.chomp.empty? && @base_grid.extinction? ? show_generation : break }
    show_generation
  end

  def show_generation
    puts "Generation: #{@gen += 1}"
    @base_grid.show
    next_generation
    puts 'Enter a letter to exit: '
  end

  def ask_info
    puts 'Please type the numbers of rows:'
    row = gets.to_i
    puts 'Please type the numbers of columns:'
    column = gets.to_i
    @base_grid = Grid.new(row, column)
    @neighbors_grid = Neighbors.new(row, column, @base_grid.cells)
  end
end

game = Game.new
game.ask_info
game.main_loop
