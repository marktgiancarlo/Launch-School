class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  
  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new('joe', 3)
mark = Student.new('mark', 4)

p joe.better_grade_than?(mark)
