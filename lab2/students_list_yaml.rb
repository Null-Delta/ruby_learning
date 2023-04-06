require 'json'
require 'yaml'

class StudentsListJson < StudentListFormat
    attr_accessor :students

    def read_from(filename)
        @students = YAML.load_file(filename)
    end

    def write_to(filename)
        File.open(filename, 'w') do |file|
            file.write(@students.to_yaml)
        end
    end
end