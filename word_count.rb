class Phrase

  def initialize(phrase)
    @words = phrase.downcase.scan(/\w+'?\w+|\d+/)
  end

  def word_count
    Hash[@words.uniq.map { |word| [word, @words.dup.keep_if { |x| x == word }.length ] }]
  end

end