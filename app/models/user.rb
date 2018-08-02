class User < ActiveRecord::Base
  has_many :playlists

  def self.setup_user
    prompt = TTY::Prompt.new
    user_input = prompt.select("What's your status?",
      %w(New_User Current_User))

    if user_input == "New_User"
      self.create_new_user
    else
      self.find_existing_user
    end
  end

  def self.create_new_user
    puts "Please create username:"
    user_name = gets.chomp

    if User.find_by(name: user_name)
      puts "Username already taken"
      create_new_user
    end

    current_user = User.create(name: user_name)
    puts "New user created! Welcome, #{current_user.name}!"
    current_user
  end

  def self.find_existing_user
    puts "Please enter username:"
    user_name = gets.chomp
    if current_user = User.find_by(name: user_name)
      puts "Welcome back, #{nameFromUser}!"
    else
      puts "Username not found"
      find_existing_user
    end
    current_user
  end
end
