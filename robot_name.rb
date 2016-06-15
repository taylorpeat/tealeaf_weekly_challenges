class Robot
  attr_reader :name
  @@names = []

  def initialize
    @name = generate_random_name
  end

  def generate_random_name
    new_name = ""
    loop do
      new_name = ""
      2.times do
        new_name += generate_random_letter
      end
      3.times do
        new_name += generate_random_number
      end

      valid_name = new_name unless @@names.include?(new_name)
      break if valid_name
    end

    @@names << valid_name
    valid_name
  end

  def generate_random_number
    rand(10).to_s
  end
  
  def generate_random_letter
    (rand(26) + 65).chr
  end

  def valid_name

  end

  def reset
    @name = generate_random_name
  end
end