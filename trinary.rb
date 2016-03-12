class Trinary
  attr_reader :to_decimal

  def initialize(tri_num)
    tri_num = tri_num.chars.map(&:to_i)
    @to_decimal = tri_num.inject(0) { |sum, num| (sum + num) * 3 } / 3
  end
end