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

array = File.read(ARGV[1]).split(" ").map { |v| v.to_i }

case ARGV[0].to_i
when 0
    puts min(array)
when 1
    puts first_positive_index(array)
end