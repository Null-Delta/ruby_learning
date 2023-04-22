require_relative './create_student_view.rb'

class CreateStudentController
    attr_reader :ui
    attr_accessor :onCreate

    def initialize()
        @ui = CreateStudentView.new(self, nil)
    end
end