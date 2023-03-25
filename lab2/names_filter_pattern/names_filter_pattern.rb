class NamesFilterPattern
    def execute(object)
        puts 'Метод не реализован'
    end
end

class DefaultNameFilterPattern
    def execute(object)
        filter_names(select_names(object))
    end

    private def select_names(object)
        object.instance_variables.map { |x| x.to_s[1..-1] }
    end

    private def filter_names(names)
        names.filter { |x| x  != "@id" }
    end
end