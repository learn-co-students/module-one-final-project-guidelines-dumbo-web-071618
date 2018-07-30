class User < ActiveRecord::Base
    has_many :todos

    def create_todo(file_path, comment, category)
        new_todo =  self.todos.build(file_path: file_path, comment: comment)
        new_todo.category = category
        new_todo
    end

    def get_first
        self.todos.first
    end

    def get_last
        self.todos.last
    end

    def list_all_todos
        self.todos.each do |todo|
            puts "id: #{todo.id} | path: #{todo.file_path} | comment: #{todo.comment}"
        end
    end
end
