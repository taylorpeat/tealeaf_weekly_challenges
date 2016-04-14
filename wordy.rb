class WordProblem
  attr_reader :elements

  def initialize(phrase)
    @elements = phrase.scan(/-?\d+|plus|minus|divided|multiplied/)
    raise ArgumentError if elements.all? { |segment| segment =~ /\d+/}
  end

  def answer
    running_tally = elements[0].to_i
    (1..elements.length - 1).step(2) do |i|
      running_tally = send(elements[i], running_tally, elements[i+1].to_i)
    end
    running_tally
  end

  def plus(num1, num2)
    num1 + num2
  end

  def minus(num1, num2)
    num1 - num2
  end

  def multiplied(num1, num2)
    num1 * num2
  end

  def divided(num1, num2)
    num1 / num2
  end
end
