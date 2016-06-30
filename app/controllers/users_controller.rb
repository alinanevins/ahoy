class UsersController < ApplicationController
  def index
  end

  def create
    @user = build_resource
  end

  def new
  end

  def edit
  end

  def show
  @user = User.find(current_user.id)
  binding.pry
  end

  def update
    @user = resource
  end

  def destroy
  end
end
