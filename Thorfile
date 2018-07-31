require_relative "config/environment.rb"

class Doit < Thor
  desc "all", "Returns all todos for all user"
  method_option :all, :aliases => "-a", :desc => "Displays all todos"
  #TODO: pull implementation into method?
  def all
    Print.print_all
  end

  desc "file", "Display todo's for file"
  method_option :scan, :aliases => "-f", :desc => "Display todo's for a file based on the file path passed in"
  def scan(file_path)
    Todo.find_by(file_path: file_path)
  end

  desc "login", "Login user"
  method_option :scan, :aliases => "-u", :desc => "If user exists, sets that user as the current logged in user."
  def login
    #TODO: if user exists, log in user
  end

  desc "scan", "Scan all files"
  method_option :scan, :aliases => "-s", :desc => "Scan all script files in present working directory"
  def scan
    #TODO: Implement scan all files
  end

  desc "user", "Returns all todo's for logged in user"
  method_option :scan, :aliases => "-u", :desc => "Returns all the todos for the user"
  def user
    #TODO: Return all todos for a particular user
  end
end