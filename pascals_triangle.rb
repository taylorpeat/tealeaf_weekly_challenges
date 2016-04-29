class Triangle
  attr_reader :rows

  def initialize(num_of_rows)
    @rows = create_triangle(num_of_rows)
  end

  def create_triangle(num_of_rows)
    (1..(num_of_rows - 1)).each_with_object(Array.new(num_of_rows, [1])) do |row_num, rows|
      (row_num - 1).times do |i|
        rows[row_num] += [rows[row_num - 1][i] + rows[row_num - 1][i + 1]]
      end
      rows[row_num] += [1]
    end
  end
end