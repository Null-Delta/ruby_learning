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
        @lastname = lastname
        @firstname = firstname
        @patronymic = patronymic
        @id = id
        @phone = phone
        @telegram = telegram
        @email = email
        @git = git
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
end