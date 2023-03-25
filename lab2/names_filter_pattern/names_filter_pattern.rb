require_relative './name_filterer.rb'

class NamesFilterPattern
    attr_private_accessor :name_filterer

    def initialize(name_filterer:) 
        self.name_filterer = name_filterer
    end

    def execute(object)
        filter_names(select_names(object))
    end

    private def select_names(object)
        object.instance_variables.map { |x| x.to_s[1..-1] }
    end

    private def filter_names(names)
        name_filterer.filter(names)
    end
end