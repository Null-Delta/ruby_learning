require_relative './student.rb'

student1 = Student.new(
    lastname: "Хахук",
    firstname: "Рустам", 
    patronymic: "Нальбиевич",
    params: {
        id: "2356",
        telegram: "@delta_null", 
        email: "delta.null@vk.ru"    
    }
)

student2 = Student.new(
    patronymic: "Рашидович",
    lastname: "Шичиях", 
    firstname: "Ильяс",
    params: {
        phone: "8-918-226-07-47"
    }
)

puts student1
puts student2