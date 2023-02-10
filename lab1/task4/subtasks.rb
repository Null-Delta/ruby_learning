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

puts subtask2([1,2,3, -1, 4, 5])