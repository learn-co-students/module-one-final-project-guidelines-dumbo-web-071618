require_relative '../config/environment'

gabe = User.new(name: "gabe")
refactor = Category.new(name: "Refactor")
gabe.create_todo("path/to/file", "This is a test comment for gabriel", refactor)
gabe.save

# gabe.list_all_todos



