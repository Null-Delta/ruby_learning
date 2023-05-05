require 'mc_delta'
require 'sinatra'

set :port, 8000

students_model = McDelta::StudentsList.new(
    McDelta::StudentsListDBAdapter.new(
        McDelta::StudentsListDB
    )
)

main_controller = McDelta::ViewController.new(students_model)
main_controller.on_update_data = lambda {

}
main_controller.selected_page = 0

editing_id = nil

get "/" do
    send_file 'web/main.html'
end

post "/students" do
    main_controller.update_table()
    result = main_controller.data_list.list.map { |student|
        student.as_json
    }

    puts result
    result.to_json
end

post "/next_page" do
    main_controller.next_page()
    main_controller.update_table()
end

post "/last_page" do
    main_controller.last_page()
    main_controller.update_table()
end

get "/get_page" do
    (main_controller.selected_page + 1).to_s
end

get "/get_pages_count" do
    main_controller.pages_count.to_s
end



post "/set_editing_id:id" do
    puts "abibbiba"
    puts params[:id]
    editing_id = params[:id]
end

get "/get_editing_id" do
    editing_id.to_s
end

post "/delete:id" do
    puts params[:id]
    main_controller.remove_student(params[:id])
end

post "/editing:id" do
    student = main_controller.get_student(params[:id])
    [student.as_json].to_json
end

get "/add" do
    send_file 'web/add.html'
end

get "/edit:student" do
    student = McDelta::Student.from_json(JSON.parse(params[:student]))
    puts student
    main_controller.replace_student(student.id, student)
end

get "/insert:student" do
    student = McDelta::Student.from_json(JSON.parse(params[:student]))
    puts student

    main_controller.add_student(student)
end