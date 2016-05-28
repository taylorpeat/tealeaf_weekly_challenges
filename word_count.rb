class Phrase

  def initialize(phrase)
    @words = phrase.gsub(/[^\w\s',]/, "").downcase.split(/'?\s+'?|,\s?/)
  end

  def word_count
    Hash[@words.uniq.map { |word| [word, @words.dup.keep_if { |x| x == word }.length ] }]
  end

end