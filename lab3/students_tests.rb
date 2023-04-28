require "test/unit"
require_relative "./students_list.rb"
require_relative "./attr_limited_regex_accessor.rb"
require_relative "./students_list_adapter.rb"
require_relative "./database/students_list_db.rb"
require_relative "./student/student.rb"
require_relative "./data_list.rb"

class StudentsTests < Test::Unit::TestCase
    def test_add
        @students = StudentsList.new(
            StudentsListDBAdapter.new(
                StudentsListDB
            )
        )

        @start_count = @students.count
        
        @students.add_student(
            Student.new(
                lastname: "AAA",
                firstname: "BBB",
                patronymic: "CCC",
                params: {
                    email: "test@email.com"
                }
            )    
        )

        assert_equal(1, @students.count - @start_count)
    end

    def test_delete
        @students = StudentsList.new(
            StudentsListDBAdapter.new(
                StudentsListDB
            )
        )

        @students.add_student(
            Student.new(
                lastname: "AAA",
                firstname: "BBB",
                patronymic: "CCC",
                params: {
                    email: "test@email.com"
                }
            )    
        )

        @students.add_student(
            Student.new(
                lastname: "AAA",
                firstname: "BBB",
                patronymic: "CCC",
                params: {
                    email: "test@email.com"
                }
            )    
        )

        @current_count = @students.count

        @students_list = @students.get_students(0, 10, nil)

        @students.remove_student(@students_list[0].id)

        assert_equal(1, @current_count - @students.count)
    end
end