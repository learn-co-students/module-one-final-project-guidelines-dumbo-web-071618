
class User < ActiveRecord::Base

  has_many :favorite_bars
  has_many :bars, through: :favorite_bar

  #User
  def self.create_user_or_login
    puts "Enter 1 to create a user or \n 2 to login."
    input = gets.chomp.to_i
    if input == 1
      self.create_user
    elsif input == 2
      self.login
    else
      puts "Incorrect Input"
      self.create_user_or_login
    end
  end

  def self.login
    puts "Please enter your username: "
    username = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
    self.find_by(name: username) || self.login
  end

  def self.create_user
    puts "Please enter a new username: "
    username = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
    if self.find_by(name: username)
      puts "Username already taken."
      self.create_user
    else
      self.create(name: username)
    end
  end

  def ask_location
    if !self.location
      puts "A location has not been specified. Please set your location"
      new_location = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
      self.update(location: new_location)
    else
      puts "Your current location is #{self.location}. Would you like to find a new location?"
      puts "Enter 1 to change your location or 2 to keep your saved location."
      input = gets.chomp.to_i
      case input
        when 1
          new_location = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
          self.update(location: new_location)
          puts "Your new location is: #{self.location}."
        when 2
          puts "Location has not been changed"
        else
          "Invalid input"
          self.ask_location
      end
    end
  end

  def find_bar
    puts "These are the bars in your location!"
    YelpAdapter.seach(self.location).each do |bar|
      Bar.create(name: bar["name"], rating: bar["rating"], location: bar["location"]["display_address"].join(" "))
    end
  end

  def add_bar
    puts "Please enter the name of the bar you'd like to add."
    bar_name = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
    bar = Bar.find_by(name: bar_name)
    if bar.id == FavBar.find(bar.id)
      puts "The bar you are trying to add already exists in your favorites."
    else
      FavBar.create(user_id: self.id, bar_id: bar.id)
      puts "You have added the bar: #{bar_name}, to your favorite bar list!"
    end
  end

  def remove_bar
    puts "Please enter the name of the bar you'd like to remove."
    bar_name = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
    bar = Bar.find_by(name: bar_name)
    if FavBar.destroy(bar)
      puts "You have successfully removed the bar #{bar_name} from your favorites."
    else
      puts "The bar you are trying to remove does not exist. Please try again."
      self.remove_bar
    end
  end




end
