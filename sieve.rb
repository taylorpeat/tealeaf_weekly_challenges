class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def primes
    array =*(2..limit)
    i = 2
    loop do
      array -= array.select { |num| num % i == 0 }.drop(1)
      i = array[array.index(i) + 1]
      break if i * 2 > limit
    end
    array
  end
end

