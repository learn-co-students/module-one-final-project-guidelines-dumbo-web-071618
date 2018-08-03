require 'colorize'
class Print

  def self.print_all
    window_size = ENV['COLUMNS'].to_i
    rs = window_size/4 #=>rs is relative size
    puts sprintf("%#{rs}s %#{rs}s %#{rs}s", "Name".center(rs),"File Path".center(rs),"Comment".center(rs))
    puts sprintf("%#{rs}s %#{rs}s %#{rs}s", "----".center(rs),"---------".center(rs),"-------".center(rs))


    Todo.all.each do |todo|
      temp_user = User.find(todo.user_id).name.center(rs)
      temp_file_path = todo.project_file.file_path.split("/")[-2..-1].join("/").center((rs-3))
      temp_file_path = "...#{temp_file_path[-(rs-3)..-1].center(rs)}" if temp_file_path.length > rs
      temp_comment = todo.comment[0..rs].center(rs)

      puts sprintf("%#{rs}s %#{rs}s %#{rs}s", temp_user,temp_file_path,temp_comment)

    end
    return nil
  end

  def self.print_user_todos(user)
    puts sprintf("%25s %25s %50s", "Name".center(25),"File Path".center(25),"Comment".center(50))
    puts sprintf("%25s %25s %50s", "----".center(25),"---------".center(25),"-------".center(50))
    user.list_all_todos.each do |todo|
    temp_user = User.find(todo.user_id).name.center(25)
    temp_file_path = todo.project_file.file_path.center(25)
    temp_comment = todo.comment[0..49].center(50)
      puts sprintf("%25s %25s %50s", temp_user,temp_file_path,temp_comment)

    end
  end

  def self.ascii_art
    window_size = ENV['COLUMNS'].to_i

    art = [

    "███╗   ███╗ ██████╗  ██████╗ ███╗   ██╗███████╗██╗  ██╗ ██████╗ ████████╗".center(window_size),
    "████╗ ████║██╔═══██╗██╔═══██╗████╗  ██║██╔════╝██║  ██║██╔═══██╗╚══██╔══╝".center(window_size),
    "██╔████╔██║██║   ██║██║   ██║██╔██╗ ██║███████╗███████║██║   ██║   ██║   ".center(window_size),
    "██║╚██╔╝██║██║   ██║██║   ██║██║╚██╗██║╚════██║██╔══██║██║   ██║   ██║   ".center(window_size),
    "██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║ ╚████║███████║██║  ██║╚██████╔╝   ██║   ".center(window_size),
    "╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ".center(window_size),
  ]

  art.each{|x| puts  x}


  end

  def self.moon

    system('clear')
    window_l = ENV['COLUMNS'].to_i
    window_h = ENV['LINES'].to_i

    padding = (" "*window_l).colorize(:color => :light_yellow, :background => :black)
    color_moon = {:color => :light_yellow, :background => :black}
    color_logo = {:color => :light_blue, :background => :black}
    small_art = [
    moon_logo1 = "███╗   ███╗ ██████╗  ██████╗ ███╗   ██╗███████╗██╗  ██╗ ██████╗ ████████╗".center(window_l).colorize(color_logo),
    moon_logo2 = "████╗ ████║██╔═══██╗██╔═══██╗████╗  ██║██╔════╝██║  ██║██╔═══██╗╚══██╔══╝".center(window_l).colorize(color_logo),
    moon_logo3 = "██╔████╔██║██║   ██║██║   ██║██╔██╗ ██║███████╗███████║██║   ██║   ██║   ".center(window_l).colorize(color_logo),
    moon_logo4 = "██║╚██╔╝██║██║   ██║██║   ██║██║╚██╗██║╚════██║██╔══██║██║   ██║   ██║   ".center(window_l).colorize(color_logo),
    moon_logo5 = "██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║ ╚████║███████║██║  ██║╚██████╔╝   ██║   ".center(window_l).colorize(color_logo),
    moon_logo6 = "╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ".center(window_l).colorize(color_logo)]



((ENV['LINES'].to_i-2)/2-11).times do puts (" "*window_l).colorize(:color => :light_yellow, :background => :black) end
big_art = [
padding,
padding,
"                                                                                  I7+++??????77=          ".center(window_l).colorize(color_moon),
"                                                                               +I++??????????????7.       ".center(window_l).colorize(color_moon),
"                                                                             7++???????????????????7.     ".center(window_l).colorize(color_moon),
"                                                                           ,77II777??????????????????7    ".center(window_l).colorize(color_moon),
"                                                                                   .7?????????????????7   ".center(window_l).colorize(color_moon),
"                                                                                      7????????????????7  ".center(window_l).colorize(color_moon),
"                                                                                      .I????????????????7 ".center(window_l).colorize(color_moon),
"                                                                                       :+Z???????ZI??????,".center(window_l).colorize(color_moon),
"███╗   ███╗ ██████╗  ██████╗ ███╗   ██╗███████╗██╗  ██╗ ██████╗ ████████╗               7+???????????????7".center(window_l).colorize(color_moon),
"████╗ ████║██╔═══██╗██╔═══██╗████╗  ██║██╔════╝██║  ██║██╔═══██╗╚══██╔══╝               ██???????███?????7".center(window_l).colorize(color_moon),
"██╔████╔██║██║   ██║██║   ██║██╔██╗ ██║███████╗███████║██║   ██║   ██║                  ███?????█████????7".center(window_l).colorize(color_moon),
"██║╚██╔╝██║██║   ██║██║   ██║██║╚██╗██║╚════██║██╔══██║██║   ██║   ██║              :===+????????███?????7".center(window_l).colorize(color_moon),
"██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║ ╚████║███████║██║  ██║╚██████╔╝   ██║                 +++??I????????????7".center(window_l).colorize(color_moon),
"╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝                I++???I?????????????".center(window_l).colorize(color_moon),
"                                                                        TM          I?+?????77??????????7 ".center(window_l).colorize(color_moon),
"                                                                         ~+?????+++????????????????????7  ".center(window_l).colorize(color_moon),
"                                                                          ?+??????????????????????????7   ".center(window_l).colorize(color_moon),
"                                                                           ,I????????????????????????7    ".center(window_l).colorize(color_moon),
"                                                                             ??????????????????????7      ".center(window_l).colorize(color_moon),
"                                                                               I?????????????????7:       ".center(window_l).colorize(color_moon),
"                                                                                  =77????????77,          ".center(window_l).colorize(color_moon),
padding,
padding
]
    if window_l > 0 && window_l < 106
      small_art.each{|x| puts x}
    elsif window_l == 0 && window_h == 0
      big_art.each{|x| puts x}
    else
      big_art.each{|x| puts x}
    end
      ((ENV['LINES'].to_i-2)/2-9).times do puts (" "*window_l).colorize(:color => :light_yellow, :background => :black) end
    puts ""
  end

end
