require_relative './data_list.rb'
require_relative './data_table.rb'

module DataListObserver
    def notify(data)
        raise 'not implemented'
    end
end

module DataListNotifier
    attr_accessor :data_list_observers

    def notify
        raise 'not implemented'
    end
end

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

class DataListStudentShort
    include DataListNotifier

    def notify
        data_list_observers.each { |observer|
            observer.notify(self.get_data)
        }
    end

    def add_observer(observer)
        self.data_list_observers << observer
    end

    def remove_observer(observer)
        self.data_list_observers.delete(observer) 
    end
end