require_relative "../attr_limited_regex_accessor.rb"
require_relative "./abstract_student.rb"

class Student < AbstractStudent    
    attr_limited_regex_accessor :phone, '/\d-\d{3}-\d{3}-\d{2}-\d{2}/'
    attr_limited_regex_accessor :email, '/\w*@\w*.\w{2,3}/'
    attr_limited_regex_accessor :telegram, '/@\w*/'
    attr_limited_regex_accessor :git, '/@\w*/'

    public_class_method :new

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

    def self.from_json(json)
        params = json.map { |v| 
            [v[0].to_sym, v[1]]
        }.filter { |v|
            v[1] != "NULL"
        }.to_h

        Student.new(
            lastname: json["lastname"],
            firstname: json["firstname"],
            patronymic: json["patronymic"],
            params: params
        )
    end

    def self.from_string(str)
        params = str
        .split(";")
        .map { |x| x.split(":") }
        .map { |x| [x[0].to_sym, x[1]] }
        .to_h

        if params[:fio] == nil
            raise "invalid string representation"
        end

        fio_components = params[:fio].split(" ")

        Student.new(
            lastname: fio_components[0],
            firstname: fio_components[1],
            patronymic: fio_components[2],
            params: params
        )
    end

    def have_any_contact
        phone != nil || telegram  != nil || email != nil || git != nil
    end

    def validate
        if !have_any_contact 
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
        contacts = ""
        if git != nil then contacts << "git:#{git};" end
        if phone != nil then contacts << "phone:#{phone};" end
        if email != nil then contacts << "email:#{email};" end
        if telegram != nil then contacts << "telegram:#{telegram};" end
        
        contacts
    end

    def get_info
        if id != nil
            "id:#{id};#{fio_info};#{contacts_info}"
        else 
            "#{fio_info};#{contacts_info}"
        end
    end

    def fio_info
        "fio:#{lastname} #{firstname} #{patronymic}"
    end

    def as_json 
        {
            lastname: lastname,
            firstname: firstname,
            patronymic: patronymic,
            id: id,
            phone: phone,
            email: email,
            git: git,
            telegram: telegram
        }
    end
end