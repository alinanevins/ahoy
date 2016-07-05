class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @user = build_resource # Needed for Merit
    super
    @user.first_name = params['user']['first_name']
    @user.last_name = params['user']['last_name']
    @user.save!
    binding.pry
  end

  def update
    @user = resource # Needed for Merit
    super
  end
end
