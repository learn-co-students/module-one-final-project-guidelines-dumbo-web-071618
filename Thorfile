require_relative "config/environment.rb"

class Doit < Thor
  desc "all", "returns all todos for a user"
  method_option :all, :aliases => "-a", :desc => "Displays all todos"
  #TODO: pull implementation into method?
  def all
    User.todos.each do |todo|
      puts "puts "id: #{todo.id} | path: #{todo.file_path} | comment: #{todo.comment}""
    end
  end

end