class Battlefield < ActiveRecord::Base
  belongs_to :soldiers
  belongs_to :monsters
end
