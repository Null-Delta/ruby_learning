class StudentsListAdapter 
    def get_student(id)
    end

    def remove_student(id)
    end

    def replace_student(id, student)
    end

    def get_students(from, to)
    end

    def add_student(student)
    end

    def count
    end
end

class StudentsListDBAdapter < StudentsListAdapter
    attr_private_accessor :database_list

    def initialize(database_list)
        self.database_list = database_list
    end

    def get_student(id)
        database_list.get_student(id)
    end

    def remove_student(id)
        database_list.remove_student(id)
    end

    def replace_student(id, student)
        database_list.replace_student(id, student)
    end

    def get_students(from, to)
        database_list.get_students(from, to)
    end

    def add_student(student)
        database_list.add_student(student)
    end

    def count
        database_list.count()
    end
end

class StudentsListFormatterAdapter < StudentsListAdapter
    attr_private_accessor :formatter

    def initialize(formatter, filename)
        self.formatter = formatter
        formatter.read_from(filename)
    end

    def get_student(id)
        formatter.get_student(id)
    end

    def remove_student(id)
        formatter.delete_student(id)
    end

    def replace_student(id, student)
        formatter.replace_student(id, student)
    end

    def get_students(from, to)
        count = to - from
        k = from / count
        formatter.get_students_slice(k, count, nil)
    end

    def add_student(student)
        formatter.add_student(student)
    end

    def count
        formatter.count()
    end
end