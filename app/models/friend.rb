class Friend <ActiveRecord::Base
  has_many :friends_with_resources
  has_many :resources, through: :friends_with_resources

  def save_resource(resource_string)
    self.resources << Resource.find_by(resource: resource_string)
  end

  def show_resources
    self.resources.map {|r| r.resource}.uniq
  end

  def self.friend_exists(name)
    if friend = Friend.find_by(name: name)
      puts "#{name.capitalize}, these are your resources!"
      puts friend.show_resources
    else
      puts "Sorry, we couldn't find you!"
    end
  end
end
