class UsersController < ApplicationController
  def index
  end

  def create
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
  end

  def destroy
  end
end
