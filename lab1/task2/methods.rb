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
        if str_value[index].to_i > 3 && str_value[index].to_i % 2 == 1
            count + 1
        else 
            count
        end
    }
end

#method 3

def nums_sum(value)
    str_value = value.to_s
    (0...str_value.size)
    .map { |index| str_value[index].to_i }
    .reduce(&:+)
end

def find_solution(value)
    value_sum = nums_sum(value)

    (2...value)
    .reduce(1) { |mult, divider|
        if value % divider == 0 && nums_sum(divider) < value_sum
            mult * divider
        else
            mult
        end
    }
end

puts easy_dividers_sum(99)
puts count_of_eval(99)
puts find_solution(99)