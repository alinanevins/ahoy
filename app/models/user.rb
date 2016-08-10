class User < ActiveRecord::Base
  has_merit
  has_many :presentations
  has_many :observations
  has_many :documentations
  has_and_belongs_to_many :consultations
  has_many :transitions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end
end
