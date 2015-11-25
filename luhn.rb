class Luhn
  attr_accessor :number, :num_array

  def initialize(number)
    @number = number
    @num_array = number.to_s.chars.map { |x| x.to_i }.reverse
  end

  def addends(doubled=1)
    num_array.each_with_index do |num, idx|
      num_array[idx] = num * 2 if idx % 2 == doubled
      num_array[idx] -= 9 if num_array[idx] > 9
    end
    num_array.reverse!
  end

  def checksum(doubled=1)
    addends(doubled)
    num_array.reduce :+
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    kevin = Luhn.new(number)
    result = kevin.number * 10 + (10 - (kevin.checksum(0) % 10))
    result -= 10 if result % 10 == 0
    result
  end
end