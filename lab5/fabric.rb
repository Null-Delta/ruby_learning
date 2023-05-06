class Fabric 
    def makeMainWindow()
        students_model = McDelta::StudentsList.new(
            McDelta::StudentsListDBAdapter.new(
                McDelta::StudentsListDB
            )
        )
        
        main_controller = McDelta::ViewController.new(students_model)
    end
end