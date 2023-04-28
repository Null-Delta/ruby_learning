require_relative './data_list.rb'
require_relative './data_table.rb'

class DataListStudentShort < DataList 

    attr_private_accessor :data_constructor

    def initialize(list:, data_constructor:) 
        self.data_constructor = data_constructor

        super(list: list)
    end

    def get_names
        ["ID", "Фамилия", "Имя", "Отчество", "Гит", "Телега", "Телефон", "Почта"]
    end

    def get_data 
        self.data_constructor.execute(list, get_names)
    end

    def list=(new_list)
        @list = new_list
        notify()
    end
end