require_relative './../students_list/views/students_list_view.rb'
require 'glimmer-dsl-libui'
require 'tcl-tk'

class MainView
    include Glimmer

    attr_reader :window_view
    attr_accessor :filter_tab

    def initialize(controller)
        self.filter_tab = StudentsListView.new(controller)

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
    end
end