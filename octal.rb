class Octal
  attr_reader :oct_arr

  def initialize(oct_num)
    @oct_arr = oct_num.chars.all? { |x| /[0-7]/ === x } ? oct_num.chars.map { |num| num.to_i } : [0]
  end

  def to_decimal
    oct_arr.inject(0) {|memo, num| (memo + num) * 8 } / 8
  end
end