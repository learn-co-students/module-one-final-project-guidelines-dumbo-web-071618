class Project < ActiveRecord::Base
    has_many :files
    belongs_to :user
end