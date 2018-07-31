class User < ActiveRecord::Base
    has_many :todos
    has_many :projects, through: :todo

    def build_todo(file_path, comment, category)
        new_todo =  self.todos.build(file_path: file_path, comment: comment)
        new_todo.category = category
        new_todo.save
    end

    def list_all_todos
        Todo.all.select do |todo|
          todo.user == self
        end
    end

    def find_by_file_path(file_path)
      Todo.all.select do |todo|
        todo.file_path == file_path
      end
    end

    #TODO: refactor this
    def select_specific_todos
    array = self.list_all_todos
    array_of_file_path = array.map{|todo| todo.file_path }
    prompt = TTY::Prompt.new
    result = prompt.select("Choose a file path you would like to go in to.", array_of_file_path)

      array = array.select do |todo|
        todo.file_path == result
      end

    array_of_line_number_and_comment = array.map{|todo| "#{todo.line_number} #{todo.comment}"}
    prompt.select("Choose what todo you would like to go to.", array_of_line_number_and_comment)

    end

end
