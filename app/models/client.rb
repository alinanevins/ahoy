class Client < ActiveRecord::Base
  has_many :transitions
  has_many :users
end
