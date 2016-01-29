class School
  attr_accessor :school

  def initialize
    @school = []
  end

  def add(name, grade_num)
    class_num = find_class_num(grade_num)
    if class_num
      school[class_num][1] << name
      school[class_num][1].sort!
    else
      school << [grade_num, [name]]
      school.sort!
    end
  end

  def to_h
    school.sort!
    school.to_h
  end

  def grade(grade_num)
    class_num = find_class_num(grade_num)
    class_num ? school.select { |grade_info| grade_info[0] == grade_num }[0][1] : []
  end

  def find_class_num(grade_num)
    school.index { |grade_info| grade_info[0] == grade_num }
  end
end