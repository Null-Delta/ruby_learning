require 'json'
require 'yaml'

class StudentsListJson
    attr_accessor :students

    def read_from(filename)
        @students = YAML.load_file(filename)
    end

    def write_to(filename)
        File.open(filename, 'w') do |file|
            file.write(@students.to_yaml)
        end
    end

    def get_student(id)
        self.students.detect { |x|
            x.id == id .to_s
        }
    end

    def delete_student(id)
        index = students.index(students.detect { |x| x.id == id.to_s })
        self.students.delete_at(index)
    end

    def replace_student(id, student)
        self.students.map! { |x| x.id == id.to_s ? student : x }
    end

    def get_students_slice(k, count)
        from = min(k * count, self.students.count)
        to = min(self.students.count, from + count)

        return self.students[from...to]
    end

    def sort()
        self.students.sort_by(&:fio_info)
    end

    def count()
        self.students.count
    end
end