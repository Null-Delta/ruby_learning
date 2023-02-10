#subtask 1
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

puts subtask1([1, 5, 6, -1, 2, 3, -1, 1, 2])