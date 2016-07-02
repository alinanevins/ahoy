class Presentation < ActiveRecord::Base
  has_one :user
  has_many :observation
end
