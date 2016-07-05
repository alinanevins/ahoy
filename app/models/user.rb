class User < ActiveRecord::Base
  has_merit
  has_many :presentations
  has_many :observations
  has_many :documentations
  has_many :consultations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
end
