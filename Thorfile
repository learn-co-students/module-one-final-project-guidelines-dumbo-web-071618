require_relative "config/environment.rb"

class TDL < Thor
  desc "all", "Returns all todos for all user"
  method_option :all, :aliases => "-a", :desc => "Displays all todos"
  #TODO:4: pull implementation into method?
  def all
    Print.print_all
  end

  desc "scan", "Scan all files"
  method_option :scan, :aliases => "-s", :desc => "Scan all script files in present working directory"
  def scan
    FileMgmt.scan_all(FileMgmt.get_all_files_in_dir)
  end

  desc "user", "Returns all todo's for logged in user"
  method_option :scan, :aliases => "-u", :desc => "Returns all the todos for the user"
  def user
    User.logged_in_user.select_specific_todos
  end

  desc "editor", "choose your default editor"
  method_option :scan, :aliases => "-e", :desc => <<-LONGDESC
    Sets the default editor for opening todos.
    doit -e
  LONGDESC

  def editor
    prompt = TTY::Prompt.new
      result = prompt.select("Choose an Editor.") do |menu|
      menu.choice 'Visual Studio Code.',1
      menu.choice 'Atom',2
      menu.choice 'Sublime',3
    end
    FileMgmt.set_editor(result)
  end
end
