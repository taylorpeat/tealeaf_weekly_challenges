class Anagram
  attr_reader :original_word

  def initialize(word)
    @original_word = word
  end

  def match(candidates)
    candidates.each_with_object([]) do |candidate, anagrams|
      anagrams << candidate if same_letters(candidate) &&
                               same_number_of_each_letter(candidate) &&
                               original_word.casecmp(candidate) != 0
    end
  end

  def same_letters(candidate)
    unique_letters(candidate) == unique_letters(original_word)
  end

  def same_number_of_each_letter(candidate)
    letter_totals(candidate) == letter_totals(original_word)
  end

  def unique_letters(word)
    word.downcase.chars.uniq.sort
  end

  def letter_totals(word)
    unique_letters(word).map { |letter| word.downcase.count(letter) }
  end
end