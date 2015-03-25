# Ship
class Ship
  attr_reader :hit_count, :length

  def initialize(length = 2)
    @hit_count = 0
    @length = length
  end

  def hit
    @hit_count += 1
  end
end
