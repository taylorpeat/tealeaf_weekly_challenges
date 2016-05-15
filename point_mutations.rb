class DNA
  attr_reader :dna1

  def initialize(dna1)
    @dna1 = dna1
  end

  def hamming_distance(dna2)
    distance = 0
    length = dna1.length < dna2.length ? dna1.length : dna2.length
    for i in 0..(length - 1)
      if dna1[i] != dna2[i]
        distance += 1
      end
    end
    distance
  end
end