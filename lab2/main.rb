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

    def initialize()
        self.fio_search_value = ''
        self.git_search_value = ''
        self.git_value = 'не важно'
        self.phone_value = 'не важно'
        self.telegram_value = 'не важно'
        self.value_options = [
            'не важно',
            'есть',
            'нет'
        ]
    end

    def build_ui
        window("Lab3", 640, 480) {
            tab {
                tab_item("Фильтрация") {
                    horizontal_box {
                        vertical_box {
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

                        vertical_box {

                        }

                        vertical_box {
                            
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

