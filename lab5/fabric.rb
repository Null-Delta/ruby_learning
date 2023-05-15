class Fabric 
    def makeMainWindow()
        students_model = McDelta::StudentsList.new(
            McDelta::StudentsListDBAdapter.new(
                McDelta::StudentsListDB
            )
        )
        
        main_controller = McDelta::ViewController.new(students_model)

        view = MainView.new(students_model, main_controller)
        view.window_view.open

        main_controller
    end

    def makeCreationStudentWindow()
        controller = McDelta::CreateStudentController.new()
        adding_view = CreateStudentView.new(controller)
        adding_view.present

        controller
    end

    def makeEditingStudentWindow(student)
        controller = McDelta::EditStudentController.new(student)
        editing_view = CreateStudentView.new(controller, student)
        editing_view.present

        controller
    end
end