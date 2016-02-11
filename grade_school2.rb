class School
  attr_reader :roster

  def initialize
    @roster = Hash.new([])
  end

  def add(name, grade_num)
    (roster[grade_num] += [name]).sort!
  end

  def to_h
    roster.sort.to_h
  end

  def grade(grade_num)
    roster[grade_num] || []
  end
end