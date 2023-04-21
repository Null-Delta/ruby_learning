class DataConstructPattern 
    def execute(values, attrs)
        raise 'Метод не реализован'
    end
end

class DefaultDataConstructPattern 
    def execute(values, attrs)
        (0...values.size).map { |item_index|
            [
                values[item_index].id,
                values[item_index].lastname,
                values[item_index].firstname,
                values[item_index].patronymic,
                values[item_index].git,
                values[item_index].telegram,
                values[item_index].phone,
                values[item_index].email
            ]
        }
    end
end

