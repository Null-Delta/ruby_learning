require_relative './student/student.rb'
require_relative './student/student_short.rb'
require_relative './data_table.rb'
require_relative './data_list.rb'
require_relative './data_list_student_short.rb'
require_relative './names_filter_pattern/names_filter_pattern.rb'
require_relative './data_construct_pattern/data_construct_pattarn.rb'
require_relative './student_list_format.rb'
require_relative './students_list_format_strategy.rb'

std_list_txt = StudentListFormat.new(TxtStudentsListFormatStrategy.new())
std_list_txt.read_from("dataset.txt")

data = std_list_txt.get_students_slice(0, 7, data)
puts data.list

puts ""
data = std_list_txt.get_students_slice(1, 7, data)

std_list_txt.formater = JsonStudentsListFormatStrategy.new()
std_list_txt.write_to("new_dataset.json")
puts data.list