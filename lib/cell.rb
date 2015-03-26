# Cell
class Cell
  attr_reader :empty,  :hit, :content
  alias_method :empty?, :empty
  alias_method :hit?, :hit

  def initialize
    @empty = true
  end

  def fill(ship)
    @content = ship
    @empty = false
  end

  def hit
    fail 'Cell has already been hit' if @hit
    @hit = true
    @content.hit unless @content.nil?
  end
end
