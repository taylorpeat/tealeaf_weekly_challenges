def palindrome?(word)
  word.downcase!
  word = word.chars.select {|x| x.to_i == 0 && x != 0 }

  i = 0
  (word.length / 2).times do
    check = word[i] == word[word.length - 1 - i]
    return false unless check == true
  end
  true
end

puts palindrome?("rada2r")
puts palindrome?("fu2n")
puts palindrome?("sputnik")
puts palindrome?("racecar")
puts palindrome?("racecar333")