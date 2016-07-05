class Presentation < ActiveRecord::Base
  belongs_to :user
  has_many :observation
end
