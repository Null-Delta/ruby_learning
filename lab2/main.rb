require_relative './student/student.rb'
require_relative './student/student_short.rb'
require_relative './data_table.rb'
require_relative './data_list.rb'
require_relative './data_list_student_short.rb'
require_relative './names_filter_pattern/names_filter_pattern.rb'
require_relative './data_construct_pattern/data_construct_pattarn.rb'
require_relative './student_list_format.rb'
require_relative './students_list_format_strategy.rb'
require './database/students_list_db.rb'
require './students_list.rb'
require './students_list_adapter.rb'

require 'glimmer-dsl-libui'

class MainWindow
    include Glimmer

    attr_accessor :git_value, :git_entry_enabled
    attr_accessor :phone_value, :phone_entry_enabled
    attr_accessor :telegram_value, :telegram_entry_enabled
    attr_accessor :fio_search_value
    attr_accessor :git_search_value
    attr_accessor :phone_search_value
    attr_accessor :telegram_search_value
    attr_accessor :value_options
    attr_accessor :selected_list_index

    def initialize()
        self.fio_search_value = ''
        self.git_search_value = ''
        self.git_value = 'не важно'
        self.phone_value = 'не важно'
        self.telegram_value = 'не важно'
        self.selected_list_index = 0
        self.selected_cell = nil
        self.value_options = [
            'не важно',
            'есть',
            'нет'
        ]
    end

    def next_page 
        if @selected_list_index != (@list.count / 10.0).ceil - 1
            @selected_list_index += 1
        end


        update_table()
    end

    def last_page
        if @selected_list_index != 0
            @selected_list_index -= 1
        end
    
        update_table()
    end


    def selected_cell=(value)
        @selected_cell = value
        if @delete_button != nil
            @delete_button.enabled = value != nil
        end

        if @edit_button != nil
            @edit_button.enabled = value != nil
        end
    end

    def selected_cell
        @selected_cell
    end

    def update_table
        @next_page_button.enabled = @selected_list_index != (@list.count / 10.0).ceil - 1
        @last_page_button.enabled = @selected_list_index != 0

        @table_title.text = (@selected_list_index + 1).to_s + " из " + (@list.count / 10.0).ceil.to_s
        @dataList.list = @list.get_students(@selected_list_index * 10, (@selected_list_index + 1) * 10).list

        if @data_table != nil 
            @data_table.cell_rows = @dataList.get_data
        end
    end

    def build_ui
        @list = StudentsList.new(
            StudentsListFormatterAdapter.new(
                StudentListFormat.new(
                    TxtStudentsListFormatStrategy.new()
                ),
                "dataset.txt"
            )
        )

        @dataList = DataListStudentShort.new(
            list: @list.get_students(selected_list_index * 10, (selected_list_index + 1) * 10).list,
            name_filterer: DefaultNameFilterPattern.new(),
            data_constructor: DefaultDataConstructPattern.new()
        )

        window("Lab3", 640, 480) {
            tab {
                tab_item("Фильтрация") {
                    horizontal_box {
                        vertical_box {
                            stretchy false
                            horizontal_box {
                                stretchy false
                                label {
                                    stretchy false
                                    text 'ФИО:'
                                }
                                
                                entry {
                                    text <=> [self, :fio_search_value]
                                }
                            }
    
                            vertical_box {
                                stretchy false
    
                                horizontal_box {
                                    stretchy false
                                    label {
                                        text 'Наличие гита'
                                    }
                                    
                                    combobox {
                                        items self.value_options
                                        selected = 0
                                        selected_item <=> [self, :git_value]
                                        on_selected {
                                            @git_entry.read_only = self.git_value != 'есть'
                                        }
                                    }
                                }
    
                                @git_entry = entry {
                                    stretchy false
                                    read_only true
                                    text <=> [self, :git_search_value]
                                }                    
                            }
                            
    
                            vertical_box {
                                stretchy false
    
                                horizontal_box {
                                    stretchy false
                                    label {
                                        text 'Наличие телефона'
                                    }
                                    
                                    combobox {
                                        items self.value_options
                                        selected_item <=> [self, :phone_value]
                                        on_selected {
                                            @phone_entry.read_only = self.phone_value != 'есть'
                                        }
                                    }
                                }
    
                                @phone_entry = entry {
                                    stretchy false
                                    read_only true
                                    text <=> [self, :phone_search_value]
                                }                    
                            }
    
                            vertical_box {
                                stretchy false
    
                                horizontal_box {
                                    stretchy false
                                    label {
                                        text 'Наличие телеги'
                                    }
                                    
                                    combobox {
                                        items self.value_options
                                        selected_item <=> [self, :telegram_value]
                                        on_selected {
                                            @phone_entry.read_only = self.telegram_value != 'есть'
                                        }
                                    }
                                }
    
                                @phone_entry = entry {
                                    stretchy false
                                    read_only true
                                    text <=> [self, :telegram_search_value]
                                }                    
                            }
                        }

                        horizontal_separator {
                            stretchy false
                        }

                        vertical_box {
                            horizontal_box {
                                stretchy false
                                @last_page_button = button("<<") {
                                    enabled @selected_list_index != 0
                                    on_clicked {
                                        last_page()
                                    }
                                }
                                area {}
                                @table_title = label (@selected_list_index + 1).to_s + " из " + (@list.count / 10.0).ceil.to_s
                                area {}
                                @next_page_button = button (">>") {
                                    enabled @selected_list_index != (@list.count / 10.0).ceil - 1
                                    on_clicked {
                                        next_page()
                                    }
                                }
                            }

                            @data_table = table {
                                @dataList.get_names.map { |name|
                                    text_column(name)
                                }

                                selection <=> [self, :selected_cell]

                                cell_rows @dataList.get_data
                            }
                        }

                        horizontal_separator {
                            stretchy false
                        }

                        vertical_box {
                            label {
                                stretchy false
                                text "CRUD"
                            }

                            button("Добавить") {
                                stretchy false
                            }

                            button("обновить") {
                                stretchy false
                            }

                            @edit_button = button("изменить") {
                                stretchy false
                                enabled false
                            }
                            
                            @delete_button = button("удалить") {
                                stretchy false
                                enabled false
                            }
                            
                        }
                    }
                }

                tab_item("Что-то") {
                    
                }

                tab_item("Области") {
                    
                }
            }
        }.open
    end
end


MainWindow.new().build_ui

