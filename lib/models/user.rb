
class User < ActiveRecord::Base
  has_many :bar_lists
  has_many :bars, through: :bar_list

  def self.create_user_or_login
    puts "Welcome, please enter your username"
    username = gets.chomp
    if User.find_by(name: username)

    else
      User.create(name: username)
    end
  end



end
