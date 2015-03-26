# Ship
class Ship
  attr_reader :hit_count, :length, :sunk
  alias_method :sunk?, :sunk

  def initialize(length = 2)
    @hit_count = 0
    @length = length
  end

  def hit
    @hit_count += 1
    sink if hit_count == length
  end

  def sink
    @sunk = true
    'SUNK!'
  end
end
