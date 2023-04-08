require_relative './student/student.rb'
require_relative './student/student_short.rb'
require_relative './data_table.rb'
require_relative './data_list.rb'
require_relative './data_list_student_short.rb'
require_relative './names_filter_pattern/names_filter_pattern.rb'
require_relative './data_construct_pattern/data_construct_pattarn.rb'
require_relative './student_list_format.rb'
require_relative './students_list_format_strategy.rb'
require './database/students_list_db.rb'
require './students_list.rb'
require './students_list_adapter.rb'

studentsList = StudentsList.new(StudentsListDBAdapter.new(StudentsListDB))

puts studentsList.get_student(2)