class PresentationsController < ApplicationController
  def new
    @presentation = Presentation.new
  end

  def create
    @user = User.find(current_user.id)
    @presentation = Presentation.new
    @presentation.date = params['presentation']['date']
    @presentation.school = params['presentation']['school']
    @presentation.user_id = current_user.id
    @presentation.save!
    binding.pry
  end

  def show
  end
end
