# frozen_string_literal: true

# Create random cells and send the status attribute to another classes
class Cell
  attr_accessor :status

  def initialize
    @status = status?
  end

  def status?
    rand(0..100) > 70 ? 1 : 0
  end
end
