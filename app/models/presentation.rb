class Presentation < ActiveRecord::Base
  has_merit
  has_one :user

end
