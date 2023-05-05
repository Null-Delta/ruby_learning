require 'glimmer-dsl-libui'

class CreateStudentView
    include Glimmer
    attr_reader :view

    attr_private_accessor :firstname_field
    attr_private_accessor :lastname_field
    attr_private_accessor :patronymic_field
    attr_private_accessor :git_field
    attr_private_accessor :phone_field
    attr_private_accessor :email_field
    attr_private_accessor :telegram_field


    attr_private_accessor :firstname_error
    attr_private_accessor :lastname_error
    attr_private_accessor :patronymic_error
    attr_private_accessor :git_error
    attr_private_accessor :phone_error
    attr_private_accessor :email_error
    attr_private_accessor :telegram_error
    attr_private_accessor :summary_error

    attr_private_accessor :done_button


    attr_private_accessor :firstname_value
    attr_private_accessor :lastname_value
    attr_private_accessor :patronymic_value
    attr_private_accessor :git_value
    attr_private_accessor :phone_value
    attr_private_accessor :email_value
    attr_private_accessor :telegram_value

    attr_accessor :delegate

    def set_editing_mode()
        git_field.read_only = true
        phone_field.read_only = true
        email_field.read_only = true
        telegram_field.read_only = true

        done_button.text = "Обновить"
        done_button.enabled = true
    end

    def initialize(delegate, student = nil)
        self.delegate = delegate
        self.build_ui

        if student != nil
            self.firstname_value = student.firstname
            self.lastname_value = student.lastname
            self.patronymic_value = student.patronymic
            self.git_value = student.git
            self.phone_value = student.phone
            self.telegram_value = student.telegram
            self.email_value = student.email
        end
    end
    
    def present
        self.view.open()
    end

    def build_ui
        @view = window("Создать студента", 720, 480) {
            vertical_box {
                horizontal_box {
                    stretchy false
                    label{
                        stretchy false
                        text "Фамилия"
                    }
                    area { }
                    self.firstname_error = label {
                        stretchy false
                        text ""
                    }
                }

                self.firstname_field = entry {
                    stretchy false
                    text <=> [self, :firstname_value, after_write: ->(text) {check_errors()}]
                }

                horizontal_box {
                    stretchy false
                    label{
                        stretchy false
                        text "Имя"
                    }
                    area { }
                    self.lastname_error = label {
                        stretchy false
                        text ""
                    }
                }

                self.lastname_field = entry {
                    stretchy false
                    text <=> [self, :lastname_value, after_write: ->(text) {check_errors()}]
                }

    
                horizontal_box {
                    stretchy false
                    label{
                        stretchy false
                        text "Отчество"
                    }
                    area { }
                    self.patronymic_error = label {
                        stretchy false
                        text ""
                    }
                }

                self.patronymic_field = entry {
                    stretchy false
                    text <=> [self, :patronymic_value, after_write: ->(text) {check_errors()}]
                }

                horizontal_box {
                    stretchy false
                    label{
                        stretchy false
                        text "Гит"
                    }
                    area { }
                    self.git_error = label {
                        stretchy false
                        text ""
                    }
                }

                self.git_field = entry {
                    stretchy false
                    text <=> [self, :git_value, after_write: ->(text) {check_errors()}]
                }
    
                horizontal_box {
                    stretchy false
                    label{
                        stretchy false
                        text "Телефон"
                    }
                    area { }
                    self.phone_error = label {
                        stretchy false
                        text ""
                    }
                }

                self.phone_field = entry {
                    stretchy false
                    text <=> [self, :phone_value, after_write: ->(text) {check_errors()}]
                }

                horizontal_box {
                    stretchy false
                    label{
                        stretchy false
                        text "Почта"
                    }
                    area { }
                    self.email_error = label {
                        stretchy false
                        text ""
                    }
                }

                self.email_field = entry {
                    stretchy false
                    text <=> [self, :email_value, after_write: ->(text) {check_errors()}]
                }
    
                horizontal_box {
                    stretchy false
                    label{
                        stretchy false
                        text "Телеграм"
                    }
                    area { }
                    self.telegram_error = label {
                        stretchy false
                        text ""
                    }
                }

                self.telegram_field = entry {
                    stretchy false
                    text <=> [self, :telegram_value, after_write: ->(text) {check_errors()}]
                }

                self.summary_error = label {
                    stretchy false
                    text ""
                }

    
                self.done_button = button("Создать") {
                    stretchy false
                    enabled false
                    on_clicked {
                        delegate.onCreate.call(self.create_student())
                        self.view.destroy
                    }
                }
            }    
        }
    end

    def create_student()
        Student.new(
            lastname: self.lastname_value,
            firstname: self.firstname_value,
            patronymic: self.patronymic_value,
            params: {
                git: self.git_value,
                email: self.email_value,
                telegram: self.telegram_value,
                phone: self.phone_value
            }
        )
    end

    def check_errors()
        self.done_button.enabled = check()
    end

    def check()
        self.summary_error.text = ""
        self.firstname_error.text = ""
        self.lastname_error.text = ""
        self.patronymic_error.text = ""
        self.git_error.text = ""
        self.email_error.text = ""
        self.telegram_error.text = ""
        self.phone_error.text = ""

        if self.firstname_field.text == "" || self.lastname_field.text == "" || self.patronymic_field.text == ""
            return false
        end

        if self.git_field.text == "" && self.phone_field.text == "" && self.email_field.text == "" && self.telegram_field.text == ""
            self.summary_error.text = "Нужно указать хотя бы один параметр"
            return false
        end

        if self.git_field.text != "" && self.git_field.text !~ /@\w*/
            self.git_error.text = "Гит неверного формата"
            return false
        end

        if self.email_field.text != "" && self.email_field.text !~ /\w*@\w*.\w{2,3}/
            self.email_error.text = "Почта неверного формата"
            return false
        end

        if self.phone_field.text != "" && self.phone_field.text !~ /\d-\d{3}-\d{3}-\d{2}-\d{2}/
            self.phone_error.text = "Телефон неверного формата"
            return false
        end

        if self.telegram_field.text != "" && self.telegram_field.text !~ /@\w*/
            self.telegram_error.text = "Телега неверного формата"
            return false
        end

        return true
    end
end