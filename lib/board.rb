# Board
class Board
  attr_reader :dimensions, :grid, :all_ships_sunk
  def initialize(dim = 2, cell)
    @empty = true
    @dimensions = dim.to_s + 'x' + dim.to_s
    init_grid_with_dimensions(dim, cell)
  end

  def place_ship_horizontally(ship, coordinate) #rubocop: disable all
    chech_ship_not_placed(ship)
    check_placement_horizontal(ship, coordinate)
    (1..ship.length).each do |i|
      new_coordinate = coordinate[0] + (coordinate[1].to_i + i - 1).to_s
      @grid[new_coordinate].fill(ship)
    end
  end

  def place_ship_vertically(ship, coordinate) #rubocop: disable all
    chech_ship_not_placed(ship)
    check_placement_vertical(ship, coordinate)
    (0..ship.length - 1).each do |i|
      new_letter = (coordinate[0].downcase.ord + i).chr.upcase
      new_coordinate = new_letter + coordinate[1]
      @grid[new_coordinate].fill(ship)
    end
  end

  def print_nice # rubocop: disable all
    # Works only for 1 digit size
    (0..@dimensions.to_i - 1).each do |row|
      (1..@dimensions[0].to_i).each do |column|
        coordinate = (row + 97).chr.upcase.to_s + column.to_s
        print coordinate + ': ' + grid[coordinate].content.class.to_s + ' '
      end
      puts ''
    end
  end

  def place_shot(coordinate)
    fail 'Shot placed out of bounds' if @grid[coordinate].nil?
    @grid[coordinate].hit
    check_if_all_ships_sunk
  end

  private

  def check_if_all_ships_sunk
    @grid.each_value do |cell|
      @all_ships_sunk = false if cell.content.sunk == false
    end
  end

  def check_placement_horizontal(ship, coordinate) # rubocop: disable all
    (0..ship.length - 1).each do |i|
      new_coordinate = coordinate[0] + (coordinate[1].to_i + i).to_s
      fail 'Ship placed out of bounds' if @grid[new_coordinate].nil?
      err_msg = 'Can not place ship; overlap'
      fail err_msg if @grid[new_coordinate].content.is_a? Ship
    end
  end

  def check_placement_vertical(ship, coordinate) # rubocop: disable all
    (0..ship.length - 1).each do |i|
      new_letter = (coordinate[0].downcase.ord + i).chr.upcase
      new_coordinate = new_letter + coordinate[1]
      fail 'Ship placed out of bounds' if @grid[new_coordinate].nil?
      fail 'Can not place ship; overlap' if @grid[new_coordinate].content
    end
  end

  def chech_ship_not_placed(ship)
    @grid.each_value do |cell|
      fail 'Ship already placed' if cell.content == ship
    end
  end

  def init_grid_with_dimensions(dim, cell)
    @grid = {}
    ('A'..(dim + 96).chr.upcase).each do |letter|
      (1..dim).each do |number|
        @grid[letter + number.to_s] = cell.new
      end
    end
  end
end
