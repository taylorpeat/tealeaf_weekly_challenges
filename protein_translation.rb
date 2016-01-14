class Translation
  PROTEIN_CODON = { "Methionine" => ["AUG"], "Phenylalanine" => ["UUU", "UUC"], "Leucine" => ["UUA", "UUG"],
                    "Serine" => ["UCU", "UCC", "UCA", "UCG"], "Tyrosine" => ["UAU", "UAC"],
                    "Cysteine" => ["UGU", "UGC"], "Tryptophan" => ["UGG"], "STOP" => ["UAA", "UAG", "UGA"]}

  def self.of_codon(codon)
    PROTEIN_CODON.select { |protein, codons| codons.include?(codon) }.keys.first
  end

  def self.of_rna(strand)
    strand.slice(0..8).scan(/.{3}/).take_while { |codon| !PROTEIN_CODON["STOP"].include?(codon) }.map do |codon|
      raise InvalidCodonError unless PROTEIN_CODON.values.flatten.include?(codon)
      PROTEIN_CODON.select { |protein, codons| codons.include?(codon) }.keys.first
    end
  end
end

class InvalidCodonError < StandardError
end