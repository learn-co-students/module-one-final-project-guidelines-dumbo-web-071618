class User < ActiveRecord::Base
    has_many :todos
    has_many :project_files, through: :todos
    @@LOGGED_IN_USER = ENV.fetch('USER')

    def self.logged_in_user
        User.find_or_create_by(name: @@LOGGED_IN_USER)
    end

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
        todo.project_file.file_path == file_path
      end
    end

    #TODO:3: refactor this
    def select_specific_todos
      while true
        array = self.list_all_todos
        array_of_file_path = array.map{|todo| todo.project_file.file_path }.uniq << "exit"
        prompt = TTY::Prompt.new
        file_path = prompt.select("Choose a file path you would like to go in to.", array_of_file_path)
          if file_path == "exit"
            puts "Goodbye!"
            break
          else
            array = array.select do |todo|
            todo.project_file.file_path == file_path
          end
        array_of_line_number_and_comment = array.sort_by{|todo| todo.priority}.map{|todo| "#{sprintf("%5d %-50s Priority Level : %1d",todo.line_number, todo.comment, todo.priority)}"}
        line_and_comment = prompt.select("Choose what todo you would like to go to.",array_of_line_number_and_comment<<"back")
          if line_and_comment == "back"
            next
          else
            FileMgmt.open_at_line(line_and_comment.split(" ")[0].to_i,file_path)
          end
        end
      end
    end

end
