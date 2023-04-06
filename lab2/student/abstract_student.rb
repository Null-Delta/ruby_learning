class AbstractStudent
    private_class_method :new
    attr_accessor :lastname, :firstname, :patronymic, :id

    def get_info
        raise "method not implemented"
    end

    def fio_info
        raise "method not implemented"
    end

    def contacts_info
        raise "method not implemented"
    end

    def to_s
        get_info
    end

    def as_json 

    end
end
