class SumOfMultiples
  attr_reader :num1, :num2, :num3
  
  def initialize(num1=3, num2=5, num3=nil)
    @num1 = num1
    @num2 = num2
    @num3 = num3
  end

  def to(limit)
    SumOfMultiples.to(num1, num2, num3, limit)
  end

  def self.to(num1=3, num2=5, num3=nil, limit)
    multiples = (0..(limit - 1)).select do |num|
         num % num1 == 0 ||
         num % num2 == 0 ||
        (num % num3 == 0 if num3)
      end
    multiples.inject(:+)
  end
end