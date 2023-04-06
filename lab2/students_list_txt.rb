require_relative './student_list_format.rb'

class StudentsListTxt < StudentListFormat
    attr_accessor :students

    def read_from(filename)
        self.students = File.read(filename)
        .split("\n")
        .map { |v| Student.from_string(v) }
    end

    def write_to(filename)
        File.open(filename, 'w') { |file| 
            file.write(
                self.students.map { |student| 
                    student.get_info
                }
                .join("\n")
            )
        }
    end
end