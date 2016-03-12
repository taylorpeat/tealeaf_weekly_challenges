class Trinary
  attr_reader :to_decimal

  def initialize(tri_str)
    tri_num = tri_str.to_i == 0 ? [0] : tri_str.chars.map(&:to_i) 
    @to_decimal = tri_num.inject(0) { |sum, num| (sum + num) * 3 } / 3
  end
end