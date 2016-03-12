class Palindromes
  attr_reader :max, :min

  Single_Palindrome = Struct.new(:value, :factors)

  def initialize(max_factor:, min_factor: 1)
    @max = max_factor
    @min = min_factor
  end

  def generate
  end

  def largest
    largest_palindrome = nil
    factors = []
    
    max.downto(min) do |num1|
      break if largest_palindrome && num1 * max < largest_palindrome
      max.downto(num1) do |num2|
        break if largest_palindrome && num1 * num2 < largest_palindrome
        largest_palindrome, factors, changed = update_palindrome(largest_palindrome, factors, num1, num2)
        break if changed
      end
    end
    Single_Palindrome.new(largest_palindrome, factors)
  end

  def smallest
    smallest_palindrome = nil
    factors = []

    for num1 in min..max
      break if smallest_palindrome && num1 * min > smallest_palindrome
      for num2 in min..num1
        break if smallest_palindrome && num1 * num2 > smallest_palindrome
        smallest_palindrome, factors, changed = update_palindrome(smallest_palindrome, factors, num1, num2)
        break if changed
      end
    end
    Single_Palindrome.new(smallest_palindrome, factors)
  end

  def update_palindrome(target_palindrome, factors, num1, num2)
    current_product = num1 * num2
    if current_product.to_s == current_product.to_s.reverse
      if target_palindrome == current_product
        factors << [num1, num2]
      else
        factors = [[num1, num2]]
      end
      return [current_product, factors, true]
    end
    [target_palindrome, factors, false]
  end
end