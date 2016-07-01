class Presentation < ActiveRecord::Base
  has_merit
  has_one :user
  has_many :observation
end
