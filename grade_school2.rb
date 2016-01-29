class School
  attr_accessor :school

  def initialize
    @school = {}
  end

  def add(name, grade_num)
    school[grade_num] ? (school[grade_num] << name).sort! : school[grade_num] = [name]
  end

  def to_h
    school.sort_by { |grade, names| grade }.to_h
  end

  def grade(grade_num)
    school[grade_num] || []
  end
end