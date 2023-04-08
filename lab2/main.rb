require_relative './student/student.rb'
require_relative './student/student_short.rb'
require_relative './data_table.rb'
require_relative './data_list.rb'
require_relative './data_list_student_short.rb'
require_relative './names_filter_pattern/names_filter_pattern.rb'
require_relative './data_construct_pattern/data_construct_pattarn.rb'
require_relative './student_list_format.rb'
require_relative './students_list_format_strategy.rb'
require './database/students_db.rb'


db = StudentsDB.new()

client = Mysql2::Client.new(:host => "localhost", :username => "root")
results = client.query("USE my_db")
results = client.query("SELECT * FROM student")

puts results.map { |x| x.to_s }