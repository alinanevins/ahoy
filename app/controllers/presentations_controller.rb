class PresentationsController < ApplicationController
  before_action :authenticate_user!
  require 'csv'

  def all
    @presentation = Presentation.all

    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"all-presentions.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def index
    @presentation = Presentation.where(user_id: current_user.id)
    #prep data for progress bar
    @arbitrary_maximum = 50.0
    @progress = current_user.presentations.count / @arbitrary_maximum * 100
    @progress = @progress.to_i
  end

  def create
    @user = User.find(current_user.id)
    presentation_hash = params.delete('presentation')
    @presentation = Presentation.new
    @presentation.date = presentation_hash['date']
    @presentation.school = presentation_hash['school']
    @presentation.department = presentation_hash['department']
    @presentation.notes = presentation_hash['notes']
    @presentation.user_id = current_user.id
    if @presentation.save
      redirect_to presentation_path(@presentation.id)
    end
  end

  def new
    @presentation = Presentation.new
  end

  def show
    id = params[:id]
    @presentation = Presentation.find(id)

    presenter_id = @presentation.user_id
    a = User.find(presenter_id)
    @presenter_name = a.first_name.to_s + " " + a.last_name.to_s

    observation = Observation.find_by presentation_id: id
    if observation != nil
      @observer_id = observation.user_id
      b = User.find(@observer_id)
      @observer_name = b.first_name.to_s + " " + b.last_name.to_s
      @observation_notes = observation.notes
      @observation_id = observation.id
    else
      @observer_name = "n/a"
      @observation_id = "n/a"
    end

  end

  def edit
    id = params[:id]
    @presentation = Presentation.find(id)
    observation = Observation.find_by presentation_id: id
    if observation != nil
      @observation_id = observation.id
      @observation_edit = "/observations/" + observation.id.to_s + "/edit"
    else
      @observation_id = nil
      @observation_edit = "/observations"
    end
  end

  def update
    id = params[:id]
    presentation_hash = params.delete('presentation')
    @presentation = Presentation.find(id)
    @presentation.date = presentation_hash['date']
    @presentation.school = presentation_hash['school']
    @presentation.department = presentation_hash['department']
    @presentation.notes = presentation_hash['notes']
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
