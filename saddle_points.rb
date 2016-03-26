require 'pry'
class Matrix
  attr_reader :rows

  def initialize(matrix_string)
    @rows = matrix_string.split("\n").map { |str| str.scan(/\d+/).map(&:to_i) } 
  end

  def columns
    temp_columns = []
    rows.size.times do |num|
      temp_columns << rows.map { |row| row[num] }.flatten
    end
    temp_columns
  end

  def saddle_points
    saddle_points = []
    rows.each_with_index do |row, row_num|
      columns.each_with_index do |col, col_num|
        saddle_points << [row_num, col_num] if max?(row, col_num) && min?(col, row_num)
      end
    end
    saddle_points
  end

  def max?(array, idx)
    array[idx] == array.max
  end

  def min?(array, idx)
    array[idx] == array.min
  end
end



