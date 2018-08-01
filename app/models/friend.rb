class Friend <ActiveRecord::Base
  has_many :friends_with_resources
  has_many :resources, through: :friends_with_resources

  def save_resource(resource_string)
    self.resources << Resource.find_by(resource: resource_string)
  end

  def show_resources
    puts self.resources.map {|r| r.resource}
  end

  def self.friend_exists(name)
    if friend = Friend.find_by(name: name)
      friend.show_resources
    else
      puts "Sorry, we couldn't find you!"
    end
  end

  # def existing_friend_resources(name)
  #   if friend_exists(name) == true
  #     self.resources
  #   end
  # end

end
