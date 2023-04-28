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

class DataList 
    attr_accessor :list
    attr_private_accessor :selected_objects
    def initialize(list:)
        self.data_list_observers = []
        self.list = list
    end

    def select(index)
        selected_objects << index
    end

    def get_selected_objects
        (0...list.size)
            .filter { |x| selected_objects.include? x }
    end

    def get_names
        raise "Метод не реализован"
    end

    def get_data
        raise "Метод не реализован"
    end
end

class DataList
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