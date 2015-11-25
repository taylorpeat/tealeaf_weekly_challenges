# range
# check multiples 3
#   replace with Fizz
# check multiples 5
#   append Buzz
# print range

# Use array with index numbers as number

def fizzbuzz(limit)
  array =*(0..limit)
  array.each_with_index do |num, idx|
    array[idx] = "Fizz" if idx % 3 == 0
    if idx % 5 == 0
      if array[idx] == "Fizz"
        array[idx] += "Buzz"
      else
        array[idx] = "Buzz"
      end
    end
  end
  array.drop(1)
end

p fizzbuzz(100)