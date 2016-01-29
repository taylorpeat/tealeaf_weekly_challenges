for i in 1..100
  if i % 3 == 0
    print "Crackle"
    puts i % 5 == 0 ? "Pop" : ""
  elsif i % 5 == 0
    puts "Pop"
  else
    puts i
  end
end