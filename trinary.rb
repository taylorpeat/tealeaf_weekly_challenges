class Trinary
  attr_reader :to_decimal

  def initialize(tri_num)
    @to_decimal = tri_num.chars.map(&:to_i).inject(0) { |sum, num| (sum + num) * 3 } / 3
  end
end