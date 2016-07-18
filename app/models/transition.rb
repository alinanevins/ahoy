class Transition < ActiveRecord::Base
  belongs_to :user
  belongs_to :faculty
end
