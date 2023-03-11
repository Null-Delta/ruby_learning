require_relative "../attr_limited_regex_accessor.rb"
require_relative "./abstract_student.rb"

class Student < AbstractStudent
    attr_limited_regex_accessor :phone, '/\d-\d{3}-\d{3}-\d{2}-\d{2}/'
    attr_limited_regex_accessor :email, '/\w*@\w*.\w{2,3}/'
    attr_limited_regex_accessor :telegram, '/@\w*/'
    attr_limited_regex_accessor :git, '/@\w*/'

    def initialize(
        lastname:,
        firstname:,
        patronymic:,
        params: {}
    )
        self.lastname = lastname
        self.firstname = firstname
        self.patronymic = patronymic
        self.id = params[:id]

        self.phone = params[:phone]
        self.telegram = params[:telegram]
        self.email = params[:email]
        self.git = params[:git]

        validate()
    end

    def self.from_string(str)
        params = str
        .split(";")
        .map { |x| x.split(":") }
        .map { |x| [x[0].to_sym, x[1]] }
        .to_h

        if params[:lastname] == nil || params[:firstname] == nil || params[:patronymic] == nil
            raise "invalid string representation"
        end

        Student.new(
            lastname: params[:lastname],
            firstname: params[:firstname],
            patronymic: params[:patronymic],
            params: params
        )
    end

    def have_any_contact
        phone != nil || telegram  != nil || email != nil || git != nil
    end

    def validate
        if git == nil || !have_any_contact 
            raise "Not finded git or any contact"
        end
    end

    def set_contacts(phone: nil, email: nil, git: nil, telegram: nil)
        if phone != nil then self.phone = phone end
        if email != nil then self.email = email end
        if git != nil then self.git = git end
        if telegram != nil then self.telegram = telegram end
    end

    def contacts_info
        phone != nil ? "Телефон: #{phone}" : 
        email != nil ? "Почта: #{email}" : 
        telegram != nil ? "Телеграм: #{telegram}" : 
        ""
    end

    def get_info
        "#{fio_info}; Git: #{git}; #{contacts_info}"
    end

    def fio_info
        "#{lastname} #{firstname.upcase[0]}.#{patronymic.upcase[0]}."
    end
end