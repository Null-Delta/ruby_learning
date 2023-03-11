require_relative "../attr_limited_regex_accessor.rb"

class StudentShort
    attr_reader :id, :fio
    attr_private_limited_regex_accessor :git, '/@\w*/'
    attr_private_limited_regex_accessor :email, '/\w*@\w*.\w{2,3}/'

    def initialize(id:, fio:, git:, email:)
        @id = id
        @fio = fio
        self.git = git
        self.email = email
    end
    def self.from_student(student) 
        StudentShort.new(
            id: student.id, 
            fio: "#{student.firstname} #{student.lastname.upcase[0]} #{student.patronymic.upcase[0]}",
            git: student.git,
            email: student.email
        )
    end

    def self.from_string(id, info) 
        params = info
        .split(";")
        .map { |x|
            x.split(":")
        }
        .map { |x|
            [x[0].to_sym, x[1]]
            
        }
        .to_h

        StudentShort.new(
            id: id, 
            fio: params[:fio],
            git: params[:git],
            email: params[:email]
        )
    end

    def to_s
        if id != nil
            id_info = "ID: #{id}"
        end

        fio_info = "ФИО: #{fio}"

        [id_info, fio_info,"Гит: #{git}", "Почта: #{email}"].join("\n")
    end
end