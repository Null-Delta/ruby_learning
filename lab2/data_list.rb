class DataList 
    attr_private_accessor :list

    def initialize(list:)
        self.list = list
    end
end