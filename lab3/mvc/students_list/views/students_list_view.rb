require 'glimmer-dsl-libui'

class StudentsListView
    include Glimmer

    attr_accessor :value_options

    attr_accessor :fio_search_field

    attr_accessor :git_search_field
    attr_accessor :git_search_combobox

    attr_accessor :phone_search_field
    attr_accessor :phone_search_combobox

    attr_accessor :telegram_search_field
    attr_accessor :telegram_search_combobox

    attr_accessor :email_search_field
    attr_accessor :email_search_combobox

    attr_accessor :last_page_button
    attr_accessor :next_page_button

    attr_accessor :data_table
    attr_accessor :table_title

    attr_accessor :delete_button
    attr_accessor :edit_button

    attr_accessor :delegate

    attr_reader :view

    def initialize(delegate = nil)
        self.delegate = delegate
        
        self.selected_cell = nil
        self.value_options = [
            'не важно',
            'есть',
            'нет'
        ]
    end

    def build_ui
        @view = horizontal_box {
            vertical_box {
                stretchy false
                horizontal_box {
                    stretchy false
                    label {
                        stretchy false
                        text 'ФИО:'
                    }
                    
                    fio_search_field = entry {
                        text ''
                    }
                }

                vertical_box {
                    stretchy false

                    horizontal_box {
                        stretchy false
                        label {
                            text 'Наличие гита'
                        }
                        
                        self.git_search_combobox = combobox {
                            items self.value_options
                            selected 0
                            on_selected {
                                self.git_search_field.read_only = self.git_search_combobox.selected_item != 'есть'
                            }
                        }
                    }

                    self.git_search_field = entry {
                        stretchy false
                        read_only true
                    }                    
                }
                

                vertical_box {
                    stretchy false

                    horizontal_box {
                        stretchy false
                        label {
                            text 'Наличие телефона'
                        }
                        
                        self.phone_search_combobox = combobox {
                            items self.value_options
                            selected 0
                            on_selected {
                                self.phone_search_field.read_only = self.phone_search_combobox.selected_item != 'есть'
                            }
                        }
                    }

                    self.phone_search_field = entry {
                        stretchy false
                        read_only true
                    }                    
                }

                vertical_box {
                    stretchy false

                    horizontal_box {
                        stretchy false
                        label {
                            text 'Наличие телеги'
                        }
                        
                        self.telegram_search_combobox = combobox {
                            items self.value_options
                            selected 0
                            on_selected {
                                self.telegram_search_field.read_only = self.telegram_search_combobox.selected_item != 'есть'
                            }
                        }
                    }

                    self.telegram_search_field = entry {
                        stretchy false
                        read_only true
                    }                    
                }

                vertical_box {
                    stretchy false

                    horizontal_box {
                        stretchy false
                        label {
                            text 'Наличие почты'
                        }
                        
                        self.email_search_combobox = combobox {
                            items self.value_options
                            selected 0
                            on_selected {
                                self.email_search_field.read_only = self.email_search_combobox.selected_item != 'есть'
                            }
                        }
                    }

                    self.email_search_field = entry {
                        stretchy false
                        read_only true
                    }                    
                }
            }

            horizontal_separator {
                stretchy false
            }

            vertical_box {
                horizontal_box {
                    stretchy false
                    self.last_page_button = button("назад") {
                        enabled delegate.selected_page != 0
                        on_clicked {
                            delegate.last_page()
                        }
                    }

                    area {}

                    self.table_title = label {
                        stretchy false
                        text (delegate.selected_page + 1).to_s + " из " + delegate.pages_count.to_s
                    } 

                    area {}

                    self.next_page_button = button ("вперед") {
                        enabled delegate.selected_page != delegate.pages_count - 1
                        on_clicked {
                            delegate.next_page()
                        }
                    }
                }

                self.data_table = table {
                    stretchy true

                    delegate.table_columns.map { |name|
                        text_column(name)
                    }

                    selection <=> [self, :selected_cell]

                    cell_rows []
                }
            }

            horizontal_separator {
                stretchy false
            }

            vertical_box {
                stretchy false

                label {
                    stretchy false
                    text "CRUD"
                }

                button("Добавить") {
                    stretchy false
                    on_clicked {
                        delegate.open_student_creation_window()
                    }
                }

                button("обновить") {
                    stretchy false
                }

                self.edit_button = button("изменить") {
                    stretchy false
                    enabled false
                }
                
                self.delete_button = button("удалить") {
                    stretchy false
                    enabled false
                }
            }
        }

        @view
    end

    def selected_cell=(value)
        @selected_cell = value
        if self.delete_button != nil
            self.delete_button.enabled = value != nil
        end

        if self.edit_button != nil
            self.edit_button.enabled = value != nil
        end
    end

    def selected_cell
        @selected_cell
    end
end

class StudentsListView include DataListObserver
    def notify(data)
        self.data_table.cell_rows = data
    end
end
