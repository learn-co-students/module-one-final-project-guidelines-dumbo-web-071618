
class Print

  def self.print_all
    puts sprintf("%25s %25s %50s %25s", "Name".center(25),"File Path".center(25),"Comment".center(50),"Category".center(25))
    puts sprintf("%25s %25s %50s %25s", "----".center(25),"---------".center(25),"-------".center(50),"--------".center(25))

    Todo.all.each do |todo|
      temp_user = User.find(todo.user_id).name.center(25)
      temp_file_path = todo.file_path.center(25)
      temp_comment = todo.comment[0..49].center(50)
      temp_category_id = Category.find(todo.category_id).name.center(25)

      puts sprintf("%25s %25s %50s %25s", temp_user,temp_file_path,temp_comment,temp_category_id)

    end
  end

  def self.print_user_todos(user)
    puts sprintf("%25s %25s %50s %25s", "Name".center(25),"File Path".center(25),"Comment".center(50),"Category".center(25))
    puts sprintf("%25s %25s %50s %25s", "----".center(25),"---------".center(25),"-------".center(50),"--------".center(25))
    user.list_all_todos.each do |todo|
    temp_user = User.find(todo.user_id).name.center(25)
    temp_file_path = todo.file_path.center(25)
    temp_comment = todo.comment[0..49].center(50)
    temp_category_id = Category.find(todo.category_id).name.center(25)

      puts sprintf("%25s %25s %50s %25s", temp_user,temp_file_path,temp_comment,temp_category_id)

    end
  end

end
