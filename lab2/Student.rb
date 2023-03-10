class Student
    def initialize(
        lastname,
        firstname,
        patronymic,
        id = nil,
        phone = nil,
        telegram = nil,
        email = nil,
        git = nil
    )
        set_lastname(lastname)
        set_firstname(firstname)
        set_patronymic(patronymic)
        set_id(id)
        set_phone(phone)
        set_telegram(telegram)
        set_email(email)
        set_git(git)
    end

    def get_lastname
        @lastname
    end

    def set_lastname(new_name)
        @lastname = new_name
    end

    def get_firstname
        @firstname
    end

    def set_firstname(new_name)
        @firstname = new_name
    end

    def get_patronymic
        @patronymic
    end

    def set_patronymic(new_patronymic)
        @patronymic = new_patronymic
    end

    def get_id
        @id
    end

    def set_id(new_id)
        @id = new_id
    end

    def get_phone
        @phone
    end

    def set_phone(new_phone)
        @phone = new_phone
    end

    def get_telegram
        @telegram
    end

    def set_telegram(new_telegram)
        @telegram = new_telegram
    end

    def get_email
        @email
    end

    def set_email(new_email)
        @email = new_email
    end

    def get_git
        @git
    end

    def set_git(new_git)
        @git = new_git
    end

    def to_s
        if @id != nil
            id_info = "ID: #{@id}"
        end

        fio_info = "ФИО: #{@lastname} #{@firstname} #{@patronymic}"

        if have_any_contact
            contacts_info = "Контакты:"

            contacts_info += @phone == nil ? "" : "\n\tТелефон: #{@phone}"
            contacts_info += @telegram == nil ? "" : "\n\tТелеграм: #{@telegram}"
            contacts_info += @email == nil ? "" : "\n\tПочта: #{@email}"
            contacts_info += @git == nil ? "" :  "\n\tГит: #{@git}"
        end

        [id_info, fio_info, contacts_info].join("\n")
    end

    def have_any_contact
        @phone != nil || @telegram  != nil || @email != nil || @git != nil
    end
end