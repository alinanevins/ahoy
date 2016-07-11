class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def create
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

    # @users_consultations = []
    # Consultation.all.each do |x|
    #   if x.user_id == @user.id
    #     @users_consultations << x.date.to_s(:pretty_dt)
    #   end
    # end
    #
    # @users_documentations = []
    # Documentation.all.each do |x|
    #   if x.user_id == @user.id
    #     @users_documentations << x.name
    #   end
    # end
    #
    # @users_presentations = []
    # Presentation.all.each do |x|
    #   if x.user_id == @user.id
    #     @users_presentations << x.id
    #   end
    # end

  end

  def update
    @user = User.find(params['id'])
    @user.first_name = params['user']['first_name']
    @user.last_name = params['user']['last_name']
    @user.email = params['user']['email']
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
