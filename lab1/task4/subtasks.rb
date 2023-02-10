def is_easy(value)
    if value == 1 then return false end
    (2...value)
    .select { |divider| value % divider == 0}
    .length == 0
end

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

def subtask5(array)
    array.reduce([]) { |divs, value| 
        if is_easy(value) && array.select { |x| x % value == 0 }.size != 0 && !divs.include?(value) 
            divs << value
        else
            divs
        end 
    }
end

puts subtask5([1,2,3, 4, 5, 6, 7, 8, 9, 10])