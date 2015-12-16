class Octal
  attr_accessor :oct_num

  def initialize(oct_num)
    @oct_num = oct_num.chars
  end

  def to_decimal
    if oct_num.all? { |x| /[0-7]/ === x }
      oct_arr = oct_num.map { |num| num.to_i }.reverse
      oct_arr.each_with_index {|num, idx| oct_arr[idx] = num * 8**(idx) }
      oct_arr.inject(:+)
    else
      0
    end
  end
end