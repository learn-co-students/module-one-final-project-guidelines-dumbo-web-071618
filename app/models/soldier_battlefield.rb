class SoliderBattlefield < ActiveRecord::Base
  belongs_to :soldiers
  belongs_to :battlefields
  
end
