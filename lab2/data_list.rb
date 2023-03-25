class DataList 
    attr_accessor :list
    attr_private_accessor :selected_objects
    def initialize(list:)
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