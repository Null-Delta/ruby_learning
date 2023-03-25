require_relative './data_list.rb'
require_relative './data_table.rb'
require_relative './names_filter_pattern/names_filter_pattern.rb'

class DataListStudentShort < DataList 

    attr_private_accessor :names
    attr_private_accessor :name_filterer
    attr_private_accessor :data_constructor

    def initialize(list:, name_filterer:, data_constructor:) 
        super(list: list)
        
        self.name_filterer = name_filterer
        self.data_constructor = data_constructor
        self.names = name_filterer.execute(list[0])
    end

    def get_names
        names
    end

    def get_data 
        data_constructor.execute(list, get_names)
    end
end