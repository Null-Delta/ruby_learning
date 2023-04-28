require_relative "./attr_limited_regex_accessor.rb"
class StudentsList 
    attr_private_accessor :students_list_adapter

    def initialize(adapter)
        self.students_list_adapter = adapter
    end

    def get_student(id)
        students_list_adapter.get_student(id)
    end

    def remove_student(id)
        students_list_adapter.remove_student(id)
    end

    def replace_student(id, student)
        students_list_adapter.replace_student(id, student)
    end

    def get_students(from, to, data)
        values = students_list_adapter.get_students(from, to)

        if data == nil
            data = DataList.new(list: values)
        else
            data.list = values
        end

        data.list
    end

    def add_student(student)
        students_list_adapter.add_student(student)
    end

    def count
        students_list_adapter.count()
    end
end