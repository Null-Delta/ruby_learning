require_relative './student/student.rb'
require_relative './student/student_short.rb'

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

student4 = StudentShort.from_student(student3)
student5 = StudentShort.from_string(228, "fio:Хахук Рустам Нальбиевич;git:@delta.null;email:delta.null@vk.com")


student1.set_contacts(telegram: "@Umba", email: "flex@gmail.com")

puts student1
puts student2.get_info
puts student3
puts student4
puts student5