class DNA
  attr_reader :dna1

  def initialize(dna1)
    @dna1 = dna1
  end

  def hamming_distance(dna2)
    length = dna1.length < dna2.length ? dna1.length : dna2.length
    (0..(length - 1)).reduce(0) do |distance, i|
      if dna1[i] != dna2[i]
        distance += 1
      end
      distance
    end
  end
end