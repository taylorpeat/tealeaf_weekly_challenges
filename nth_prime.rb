class Prime
  def self.nth(target)
    raise ArgumentError if target < 1
    (2..1.0/0).each_with_object([]) do |num, primes|
      sqrt = num**0.5
      primes << num unless primes.any? { |p| p <= sqrt ? num % p == 0 : break }
      return primes.pop if primes.length == target
    end
  end
end