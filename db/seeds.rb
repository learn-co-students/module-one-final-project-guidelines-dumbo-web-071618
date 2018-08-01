Todo.destroy_all
User.destroy_all
Category.destroy_all
File.destroy_all

gabe = User.create(name: "Gabriel Batista")
bryan = User.create(name: "Bryan None")
prince = User.create(name: "Prince McPrince")
eric = User.create(name: "Eric Ericson")
tony = User.create(name: "Tony Baloney")

refactor = Category.create(name: "Refactor")
review = Category.create(name: "Review")
remove = Category.create(name: "Remove")
add = Category.create(name: "Add")
extract = Category.create(name: "Extract")
