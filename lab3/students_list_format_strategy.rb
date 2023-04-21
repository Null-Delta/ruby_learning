require 'json'
require 'yaml'

class StudentsListFormatStrategy
    def read_from(filename)
        require 'method not implemented'
    end

    def write_to(filename, students)
        require 'method not implemented'
    end
end

class TxtStudentsListFormatStrategy < StudentsListFormatStrategy
    def read_from(filename)
        File.read(filename)
        .split("\n")
        .map { |v| Student.from_string(v) }
    end

    def write_to(filename, students)
        File.open(filename, 'w') { |file| 
            file.write(
                students.map { |student| 
                    student.get_info
                }
                .join("\n")
            )
        }
    end
end

class JsonStudentsListFormatStrategy < StudentsListFormatStrategy
    def read_from(filename)
        file = File.read(filename)
        json = JSON.parse(file)
        json.map { |x| Student.from_json(x) }
    end

    def write_to(filename, students)
        File.open(filename, 'w') do |f|
            f.write(JSON.generate(students.map { |x| x.as_json }))
        end
    end
end

class YamlStudentsListFormatStrategy < StudentsListFormatStrategy
    def read_from(filename)
        YAML.load_file(filename)
    end
    
    def write_to(filename, students)
        File.open(filename, 'w') do |file|
            file.write(students.to_yaml)
        end
    end
end