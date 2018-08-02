
class Print

  def self.print_all
    window_size = ENV['COLUMNS'].to_i
    rs = window_size/4 #=>rs is relative size
    puts sprintf("%#{rs}s %#{rs}s %#{rs}s %#{rs}s", "Name".center(rs),"File Path".center(rs),"Comment".center(rs),"Category".center(rs))
    puts sprintf("%#{rs}s %#{rs}s %#{rs}s %#{rs}s", "----".center(rs),"---------".center(rs),"-------".center(rs),"--------".center(rs))


    Todo.all.each do |todo|
      temp_user = User.find(todo.user_id).name.center(rs)
      temp_file_path = todo.project_file.file_path.split("/")[-2..-1].join("/").center((rs-3))
      temp_file_path = "...#{temp_file_path[-(rs-3)..-1].center(rs)}" if temp_file_path.length > rs
      temp_comment = todo.comment[0..rs].center(rs)
      temp_category_id = Category.find(todo.category_id).name.center(rs)

      puts sprintf("%#{rs}s %#{rs}s %#{rs}s %#{rs}s", temp_user,temp_file_path,temp_comment,temp_category_id)

    end
    return nil
  end

  def self.print_user_todos(user)
    puts sprintf("%25s %25s %50s %25s", "Name".center(25),"File Path".center(25),"Comment".center(50),"Category".center(25))
    puts sprintf("%25s %25s %50s %25s", "----".center(25),"---------".center(25),"-------".center(50),"--------".center(25))
    user.list_all_todos.each do |todo|
    temp_user = User.find(todo.user_id).name.center(25)
    temp_file_path = todo.project_file.file_path.center(25)
    temp_comment = todo.comment[0..49].center(50)
    temp_category_id = Category.find(todo.category_id).name.center(25)

      puts sprintf("%25s %25s %50s %25s", temp_user,temp_file_path,temp_comment,temp_category_id)

    end
  end

  def ascii_art
    art = "hi"
  end

end
