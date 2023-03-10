require_relative "./attr_limited_regex_accessor.rb"

class Student
    attr_accessor :lastname, :firstname, :patronymic, :id

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
    end

    def to_s
        if id != nil
            id_info = "ID: #{id}"
        end

        fio_info = "ФИО: #{lastname} #{firstname} #{patronymic}"

        if have_any_contact
            contacts_info = "Контакты:"

            contacts_info += phone == nil ? "" : "\n\tТелефон: #{phone}"
            contacts_info += telegram == nil ? "" : "\n\tТелеграм: #{telegram}"
            contacts_info += email == nil ? "" : "\n\tПочта: #{email}"
            contacts_info += git == nil ? "" :  "\n\tГит: #{git}"
        end

        [id_info, fio_info, contacts_info].join("\n")
    end

    def have_any_contact
        phone != nil || telegram  != nil || email != nil || git != nil
    end
end