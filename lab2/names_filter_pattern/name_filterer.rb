class NameFilterer 
    def filter(names)
        raise "Метод не реализован"
    end
end

class WithoutIdNameFilterer < NameFilterer
    def filter(names)
        names.filter { |x| x  != "@id" }
    end
end