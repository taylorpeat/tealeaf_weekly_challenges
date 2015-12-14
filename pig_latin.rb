class PigLatin

  def self.translate(phrase)
    words = phrase.split

    words.map! do |word|
      first_sound = word.slice!(/((^[xy]|^[^aeiouy]?qu|^[^aeiouyx]*)(?=[aeiouy]))/) || ""
      word += first_sound + "ay" 
    end

    words.join(" ")
  end
end