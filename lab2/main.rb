require_relative './student.rb'

student1 = Student.new(
    lastname: "Хахук",
    firstname: "Рустам", 
    patronymic: "Нальбиевич",
    params: {
        id: "2356",
        git: "@Null_Delta",
        telegram: "@delta_null", 
        email: "delta.null@vk.ru"    
    }
)

student2 = Student.new(
    patronymic: "Рашидович",
    lastname: "Шичиях", 
    firstname: "Ильяс",
    params: {
        git: "@Abobus",
        phone: "8-918-226-07-47"
    }
)

student3 = Student.from_string("lastname:AAA;git:@delta.null;firstname:BBB;patronymic:CCC")

student1.set_contacts(telegram: "@Umba", email: "flex@gmail.com")

puts student1
puts student2
puts student3