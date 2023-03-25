require_relative './student/student.rb'
require_relative './student/student_short.rb'
require_relative './data_table.rb'
require_relative './data_list.rb'
require_relative './data_list_student_short.rb'
require_relative './names_filter_pattern/names_filter_pattern.rb'
require_relative './data_construct_pattern/data_construct_pattarn.rb'


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

short_array = [
    StudentShort.new(id: 0, fio: "Aa Bb Cc", git: "@abc", email: "abc@vk.com"),
    StudentShort.new(id: 0, fio: "Afrl Advm Apgmti", git: "@aaa", email: "aaa@vk.com"),
]

list = DataListStudentShort.new(
    list: short_array, 
    name_filterer: DefaultNameFilterPattern.new(),
    data_constructor: DefaultDataConstructPattern.new()
)

puts list.get_data