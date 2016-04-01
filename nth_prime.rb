class Prime
  def self.nth(target)
    raise ArgumentError if target < 1
    (2..1.0/0).each_with_object([]) do |num, primes|
      primes << num unless primes.any? { |prime| num % prime == 0 }
      return primes.pop if primes.length == target
    end
  end
end