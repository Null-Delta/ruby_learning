require_relative "./data_constructor.rb"

class DataConstructPattern 
    attr_private_accessor :constructor

    def initialize(constructor:)
        self.constructor = constructor
    end

    def execute(values, attrs)
        constructor.construct(values, attrs)
    end
end

