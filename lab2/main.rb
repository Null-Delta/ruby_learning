require_relative './student/student.rb'
require_relative './student/student_short.rb'
require_relative './data_table.rb'
require_relative './data_list.rb'
require_relative './data_list_student_short.rb'
require_relative './names_filter_pattern/names_filter_pattern.rb'
require_relative './data_construct_pattern/data_construct_pattarn.rb'
require_relative './student_list_format.rb'
require_relative './students_list_format_strategy.rb'
require 'mysql2'

client = Mysql2::Client.new(:host => "localhost", :username => "root")

client.query("DROP DATABASE test_db")
client.query("CREATE DATABASE test_db")
client.query("USE test_db")
client.query("CREATE TABLE users(username CHAR(20));")
client.query('INSERT INTO users (username) VALUES ROW("aboba")')

results = client.query("SELECT * FROM users")
puts results.map { |x| x.to_s }