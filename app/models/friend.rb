class Friend <ActiveRecord::Base
  has_many :friends_with_resources
  has_many :resources, through: :friends_with_resources

  def save_resource(resource_string)
    self.resources << Resource.find_by(resource: resource_string)
  end

  def show_resources
    puts self.resources.map {|r| r.resource}
  end

end
