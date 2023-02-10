def subtask1(array)
    was_max = false

    array
    .reduce(0) { |count, value|
        if value == array.min
            count = -1
            was_max = true
        end

        if was_max then count + 1 else count end
    }
end

def subtask2(array)
    was_min = false
    subarray = array.reduce([]) { |subarr, value|
        if value == array.min then was_min = true end

        if not was_min 
            array.shift
            subarr << value
        else 
            subarr
        end
    }

    array << subarray
end

def subtask3(array, range)
    array[range].max
end

def subtask4(array) 
    (1...array.size)
    .reduce([0, []]) { |hash, index|
        if array[index] < array[index - 1]
            [hash[0] + 1, hash[1] << index]
        else
            [hash[0], hash[1]]
        end
    }
end

puts subtask4([1,2,-1, -2, 4, 5])