require_relative './student/student.rb'
require_relative './student/student_short.rb'

def read_from_txt(filename)
    File.read(filename)
    .split("\n")
    .map { |v| Student.from_string(v) }
end

def write_to_txt(filename, students)
    File.open(filename, 'w') { |file| 
        file.write(
            students.map { |student| 
                student.get_info
            }
            .join("\n")
        )
    }
end

array = read_from_txt("dataset.txt")

array[0].set_contacts(email: "updated.mail@email.com")
write_to_txt("new_dataset.txt", array)
array = read_from_txt("new_dataset.txt")