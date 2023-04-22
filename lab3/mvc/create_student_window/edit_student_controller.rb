class EditStudentController
    attr_reader :ui
    attr_accessor :onCreate
    attr_reader :edit_user_id

    def initialize(student)
        @edit_user_id = student.id
        @ui = CreateStudentView.new(self, student)
        @ui.set_editing_mode()
    end
end