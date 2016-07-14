class Observation < ActiveRecord::Base
  belongs_to :presentation
  belongs_to :user

end
