class PhoneNumber
  attr_reader :num
  BLANK_NUM = "0000000000"

  def initialize(input_num)
    @num = input_num
  end

  def number
    /[a-zA-z]/.match(num) ? num.replace(BLANK_NUM) : formatted_number
  end

  def formatted_number
    num.gsub!(/\D/, "")
    num.sub!(/^1(?=\d{10})/, "")
    num.length == 10 ? num : num.replace(BLANK_NUM)
  end

  def area_code
    number.slice(0..2)
  end

  def to_s
    number
    "(#{num.slice(0..2)}) #{num.slice(3..5)}-#{num.slice(6..9)}"
  end
end