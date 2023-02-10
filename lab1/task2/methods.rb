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