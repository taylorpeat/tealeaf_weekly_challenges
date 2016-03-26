class Matrix
  attr_reader :rows, :columns, :saddle_points

  def initialize(matrix_string)
    @rows = matrix_string.split("\n").map { |str| str.scan(/\d+/).map(&:to_i) } 
    @columns = rows.transpose
    coordinates = Array(0..rows.size - 1).product(Array(0..rows.first.size - 1))
    @saddle_points = coordinates.select { |coord| check_for_saddle(coord) }
  end

  def check_for_saddle(co)
    rows[co[0]][co[1]] == rows[co[0]].max && rows[co[0]][co[1]] == columns[co[1]].min
  end
end