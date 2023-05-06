class Lab
    attr_accessor :number
    attr_accessor :name
    attr_accessor :theme
    attr_accessor :deadline

    attr_accessor :tasks

    def initialize(number, name, theme, deadline, tasks)
        self.number = number
        self.name = name
        self.theme = theme
        self.deadline = deadline
        self.tasks = tasks
    end

    def self.from_json(json)
        params = json.map { |v| 
            [v[0].to_sym, v[1]]
        }.filter { |v|
            v[1] != "NULL"
        }.to_h

        Lab.new(
            params[:number],
            params[:name],
            params[:theme],
            params[:deadline],
            params[:tasks]
        )
    end
end