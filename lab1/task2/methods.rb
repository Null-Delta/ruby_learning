#method 1

def is_easy(value)
    (2...value)
    .select { |divider| value % divider == 0}
    .length == 0
end

def easy_dividers_sum(value)
    (2...value)
        .reduce(0) { |sum, divider|
            if is_easy(divider) and value % divider == 0
                sum + divider
            else
                sum
            end
        }
end

#method 2

def count_of_eval(value)
    str_value = value.to_s
    (0...str_value.size)
    .reduce(0) { |count, index|
        if str_value[index].to_i > 3
            count + 1
        else 
            count
        end
    }
end

puts count_of_eval(123456789)