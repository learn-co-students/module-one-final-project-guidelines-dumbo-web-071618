class Resource <ActiveRecord::Base
  has_many :friends_with_resources
  has_many :friends, through: :friends_with_resources

  def self.all_for_feeling(feeling)
    Resource.all.select {|resource| resource.feeling == feeling}
  end

  def self.random(feeling)
    all = self.all_for_feeling(feeling)
    all_resources = all.map {|f|f.resource}
    friend_resources = []
    friend_resources << (all_resources - friend_resources).sample
  end

end
