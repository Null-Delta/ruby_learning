require_relative "../attr_limited_regex_accessor.rb"
require_relative "./abstract_student.rb"

class StudentShort < AbstractStudent
    attr_private_limited_regex_accessor :git, '/@\w*/'
    attr_private_limited_regex_accessor :email, '/\w*@\w*.\w{2,3}/'

    def initialize(id:, fio:, git:, email:)
        fio_components = fio.split(" ")

        self.id = id
        self.firstname = fio_components[0]
        self.lastname = fio_components[1]
        self.patronymic = fio_components[2]

        self.git = git
        self.email = email
    end

    def self.from_student(student) 
        StudentShort.new(
            id: student.id, 
            fio: "#{student.firstname} #{student.lastname} #{student.patronymic}",
            git: student.git,
            email: student.email
        )
    end

    def self.from_string(id, info) 
        params = info
        .split(";")
        .map { |x| x.split(":") }
        .map { |x| [x[0].to_sym, x[1]] }
        .to_h

        StudentShort.new(
            id: id, 
            fio: params[:fio],
            git: params[:git],
            email: params[:email]
        )
    end

    def fio_info
        "#{firstname} #{lastname.upcase[0]} #{patronymic.upcase[0]}"
    end

    def contacts_info
        "Email: #{email}"
    end

    def get_info
        [fio_info, "Git: #{git}", contacts_info].join("; ")
    end
end