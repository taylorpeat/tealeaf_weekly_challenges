class Triangle
  attr_reader :rows

  def initialize(num_of_rows)
    @rows = create_triangle(num_of_rows)
  end

  def create_triangle(num_of_rows)
    (1..(num_of_rows - 1)).each_with_object(Array.new(num_of_rows, [1])) do |row_num, rows|
      current_row = rows[row_num]
      prev_row = rows[row_num - 1]
      (row_num - 1).times do |i|
        current_row += [prev_row[i] + prev_row[i + 1]]
      end
      current_row += [1]
    end
  end
end