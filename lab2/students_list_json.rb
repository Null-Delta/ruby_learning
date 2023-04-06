require 'json'
require_relative './student_list_format.rb'

class StudentsListJson < StudentListFormat
    attr_accessor :students

    def read_from(filename)
        file = File.read(filename)
        self.students = JSON.parse(file)
    end

    def write_to(filename)
        File.open(filename, 'w') do |f|
            f.write(@students.to_json)
        end
    end
end