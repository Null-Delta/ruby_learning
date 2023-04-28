require 'mc_delta'
require_relative './views/main_view.rb'

students_model = StudentsList.new(
    StudentsListDBAdapter.new(
        StudentsListDB
    )
)

view = MainView.new(students_model)
view.window_view.open