#subtask 1

def min(array)
    local_min = array[0]

    for index in 0...array.size
        if array[index] < local_min 
            local_min = array[index]
        end
    end

    local_min
end

def first_positive_index(array)

    for index in 0...array.size
        if array[index] > 0
            return index
        end
    end
end

array = [-1, 2, 3, -2, 5, 0]

puts min array
puts first_positive_index array