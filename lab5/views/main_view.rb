require_relative './students_list_view.rb'
require_relative './create_student_view.rb'
require 'glimmer-dsl-libui'
require 'mc_delta'

class MainView
    include Glimmer

    attr_reader :window_view
    attr_accessor :filter_tab

    attr_accessor :controller

    def initialize(model, controller)

        self.controller = controller
        self.filter_tab = StudentsListView.new(controller)

        self.controller.data_list.add_observer(self.filter_tab)

        @window_view = window("Lab3", 720, 480) {
            @tabs = tab {
                @tab_item = tab_item("Фильтрация") {
                    self.filter_tab.build_ui
                }

                tab_item("Ничего") {
                    
                }

                tab_item("Ничего 2") {
                    
                }
            }
        }

        self.controller.on_update_data = lambda {
            self.filter_tab.next_page_button.enabled = self.controller.selected_page != self.controller.pages_count - 1
            self.filter_tab.last_page_button.enabled = self.controller.selected_page != 0
            self.filter_tab.table_title.text = (self.controller.selected_page + 1).to_s + " из " + self.controller.pages_count.to_s
        }

        self.controller.on_add_student_clicked = lambda {
            controller = Fabric.new().makeCreationStudentWindow()
            controller.onCreate = lambda { |student|
                self.controller.add_student(student)
                self.controller.update_table()
            }
        }

        self.controller.on_edit_student_clicked = lambda { |id|
            student = controller.get_student(id)
            controller = Fabric.new().makeEditingStudentWindow(student)
            controller.onCreate = lambda { |student|
                self.controller.replace_student(controller.edit_user_id, student)
                self.controller.update_table()
            }
        }

        self.controller.update_table()

    end
end