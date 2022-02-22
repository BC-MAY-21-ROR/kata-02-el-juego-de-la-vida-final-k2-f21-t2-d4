# frozen_string_literal: true
require './cell'
 
# The Grid class is responsible for creating the grid
class Grid
  
  attr_accessor :cells

  def initialize(width, heigth)
    @width = width
    @heigth = heigth
    @cells = []
    make_cells_grid
  end

  def show()
    @cells.each do |row|
      row.each { |cell| (cell.status == 1 ? (print '*') : (print '.')) }
      puts ""
    end
    puts ''
  end

  def one_line_grid
    @cells.flatten
  end

  private
  def make_cells_grid
    @width.times do |x|
      @cells.push([])
      @heigth.times do |y|
        @cells[x].push(Cell.new())
      end
    end
  end
end