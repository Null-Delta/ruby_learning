require_relative './student/student.rb'
require_relative './student/student_short.rb'

def read_from_txt(filename)
    File.read(filename)
    .split("\n")
    .map { |v| Student.from_string(v) }
end

puts read_from_txt("dataset.txt")