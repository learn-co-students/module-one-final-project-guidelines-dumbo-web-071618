require_relative "config/environment.rb"

class Todo < Thor
  desc "all", "returns all todos for a user"
  method_option :all, :aliases => "-a", :desc => "Displays all todos"
  def all
    u = User.new(name: "test")
    puts u.name
  end

end