require_relative './../../data_construct_pattern/data_construct_pattarn.rb'
require_relative './main_view.rb'
require_relative './../create_student_window/create_student_controller.rb'

class ViewController
    attr_private_accessor :model
    attr_private_accessor :view
    attr_private_accessor :data_list

    attr_accessor :selected_page

    def initialize(model)
        self.model = model

        self.selected_page = 0

        self.data_list = DataListStudentShort.new(list: [], data_constructor: DefaultDataConstructPattern.new())
        self.model.get_students(0, 10, self.data_list)

        self.view = MainView.new(self)
        self.data_list.add_observer(self.view.filter_tab)

        update_table()
        
        self.view.window_view.open
    end
end


# StudentsListViewDelegate
class ViewController 
    def pages_count
        (model.count / 10.0).ceil
    end

    def table_columns
        self.data_list.get_names
    end

    def next_page
        if self.selected_page != self.pages_count - 1
            self.selected_page += 1
        end

        puts self.selected_page

        update_table()
    end

    def last_page
        if self.selected_page != 0
            self.selected_page -= 1
        end

        puts self.selected_page

        
        update_table()
    end

    def update_table
        model.get_students(self.selected_page * 10, (self.selected_page + 1) * 10, self.data_list)
        self.view.filter_tab.next_page_button.enabled = self.selected_page != self.pages_count - 1
        self.view.filter_tab.last_page_button.enabled = self.selected_page != 0

        self.view.filter_tab.table_title.text = (self.selected_page + 1).to_s + " из " + self.pages_count.to_s
    end

    def open_student_creation_window()
        controller = CreateStudentController.new()
        controller.onCreate = lambda { |student|
            puts student
            model.add_student(student)
            update_table()
        }

        controller.ui.present
    end

    def remove_student(id)
        model.remove_student(id)
        update_table()
    end
end