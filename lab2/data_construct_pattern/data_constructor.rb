class DataConstructor
    def construct(values) 
        raise "Метод не реализован"
    end
end

class DefaultDataConstructor
    def construct(values, attrs) 
        (0...values.size).map { |item_index|
            (0...attrs.size + 1).map { |name_index|
                if name_index == 0 then item_index else
                    values[item_index].instance_variable_get("@#{attrs[name_index - 1]}")
                end
            }
        }
    end
end