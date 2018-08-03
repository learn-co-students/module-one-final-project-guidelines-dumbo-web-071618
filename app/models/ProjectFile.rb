class ProjectFile < ActiveRecord::Base
    belongs_to :user
    has_many :todos
    #TODO: has_many :users, through: :todos
end
