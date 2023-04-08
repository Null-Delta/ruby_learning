class StudentListFormat
    attr_private_accessor :students
    attr_accessor :formater

    def initialize(formater)
        self.formater = formater
    end

    def get_student(id)
        self.students.detect { |x|
            x.id == id .to_s
        }
    end

    def read_from(filename)
        self.students = formater.read_from(filename)
    end

    def write_to(filename)
        formater.write_to(filename, self.students)
    end

    def delete_student(id)
        index = students.index(students.detect { |x| x.id == id.to_s })
        self.students.delete_at(index)
    end

    def replace_student(id, student)
        self.students.map! { |x| x.id == id.to_s ? student : x }
    end

    def get_students_slice(k, count, data)
        from = [k * count, self.students.count].min
        to = [self.students.count, from + count].min

        if data == nil
            return DataList.new(list: self.students[from...to])
        else
            data.list = self.students[from...to]
            data
        end
    end

    def sort()
        self.students.sort_by(&:fio_info)
    end

    def count()
        self.students.count
    end
end