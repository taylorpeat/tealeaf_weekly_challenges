class House
  @@prototype ||= House.new

  def self.recite
    unused_verses = @@prototype.get_pieces
    unused_verses.last[0] << "."
    build_song(unused_verses)
  end

  def get_pieces
    pieces
  end

  private
  
  def self.build_song(unused_verses, verses: [], song: "")
    while unused_verses != [] do
      verses.unshift(unused_verses.pop)
      song += build_verse(verses)
    end
    song.chop
  end

  def self.build_verse(verses, verse: "")
    verses.length.times { |idx| verse += build_line(verses, idx) }
    verse + "\n"
  end

  def self.build_line(verses, idx)
    line = idx == 0 ? "This is" : verses[idx - 1][1]
    line + " " + verses[idx][0] + "\n"
  end
  
  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end