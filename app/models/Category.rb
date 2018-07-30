class Category < ActiveRecord::Base
    has_many :todos
    has_many :users, through: :todos
end