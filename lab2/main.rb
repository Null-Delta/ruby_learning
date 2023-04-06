require_relative './student/student.rb'
require_relative './student/student_short.rb'
require_relative './data_table.rb'
require_relative './data_list.rb'
require_relative './data_list_student_short.rb'
require_relative './names_filter_pattern/names_filter_pattern.rb'
require_relative './data_construct_pattern/data_construct_pattarn.rb'
require_relative './students_list_txt.rb'
require_relative './students_list_json.rb'

std_list_txt = StudentsListTxt.new()

std_list_txt.read_from("dataset.txt")
std_list_txt.get_student(1).set_contacts(email: "updated.mail@email.com")
std_list_txt.delete_student(0)
puts std_list_txt.count
std_list_txt.write_to("new_dataset.txt")

std_list_json = StudentsListJson.new()
std_list_json.read_from("new_dataset.json")
std_list_json.students = std_list_txt.students
std_list_json.write_to("new_dataset.json")

