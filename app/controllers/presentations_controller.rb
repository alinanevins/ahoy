class PresentationsController < ApplicationController

  def index
    @presentation = Presentation.all
  end

  def create
<<<<<<< 8e1bec64a30b1918f3fe13d11234d789328fe439
    @user = User.find(current_user.id)
    @presentation = Presentation.new
    @presentation.date = params['presentation']['date']
    @presentation.school = params['presentation']['school']
    @presentation.user_id = current_user.id
    @presentation.save!
    binding.pry
    presentation_hash = params.delete('presentation_hash')
=======
    presentation_hash = params.delete('presentation')
>>>>>>> added more views for the rest
    a = Presentation.new
    a.date = presentation_hash['date']
    a.school = presentation_hash['school']
    a.department = presentation_hash['department']
    a.user_id = presentation_hash['user_id']
    if a.save
      redirect_to presentation_path(a.id)
    end
  end

  def new
    @presentation = Presentation.new
  end

  def show
    id = params[:id]
    @presentation = Presentation.find(id)
  end

  def edit
    id = params[:id]
    @presentation = Presentation.find(id)
  end

  def update
    id = params[:id]
    presentation_hash = params.delete('presentation')
    @presentation = Presentation.find(id)
    @presentation.date = presentation_hash['date']
    @presentation.school = presentation_hash['school']
    @presentation.department = presentation_hash['department']
    @presentation.user_id = presentation_hash['user_id']
    if @presentation.save
      redirect_to presentation_path(@presentation.id)
    end
  end

  def destroy
    id = params[:id]
    Presentation.delete(id)
    flash[:notice] = "The presentation was successfully deleted"
    redirect_to "/"
  end
end
