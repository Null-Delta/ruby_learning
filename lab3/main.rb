require_relative './student/student.rb'
require_relative './student/student_short.rb'
require_relative './data_table.rb'
require_relative './data_list.rb'
require_relative './data_list_student_short.rb'
require_relative './student_list_format.rb'
require_relative './students_list_format_strategy.rb'
require './database/students_list_db.rb'
require './students_list.rb'
require './students_list_adapter.rb'

require_relative './mvc/main_window/view_controller.rb'


# Time Machine: 
# https://www.figma.com/file/jZG7NtYeqDL5MwffOHc5Ca/TimeMachine?node-id=0%3A1&t=VKuY8n60jMmKAvCv-1
students_model = StudentsList.new(
    StudentsListDBAdapter.new(
        StudentsListDB
    )
)
controller = ViewController.new(students_model)
