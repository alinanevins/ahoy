class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def create
    @user = build_resource
    if a.save
      redirect_to user_path(a.id)
    end
  end

  def new
    @user = User.new
  end

  def edit
    id = params[:id]
    @user = User.find(id)
  end

  def show
  id = params[:id]
  @user = User.find(id)
  end

  def update
    @user = resource
    if @user.save
      redirect_to user_path(@user.id)
    end
  end

  def destroy
    id = params['id']
    User.delete(id)
    flash[:notice] = "You deleted your account"
    redirect_to "/"
  end
end
