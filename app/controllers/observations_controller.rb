class ObservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @observation = Observation.where(user_id: current_user.id)
  end

  def create
    observation_hash = params.delete('observation')
    @observation = Observation.new
    @observation.presentation_id = observation_hash['presentation_id']
    @observation.notes = observation_hash['notes']
    @observation.user_id = current_user.id
    if @observation.save
      redirect_to observation_path(@observation.id)
    end
  end

  def new
    @observation = Observation.new
  end

  def show
    id = params[:id]
    @observation = Observation.find(id)

    presentation_id = @observation.presentation_id

  if presentation_id != nil
    a = Presentation.find(presentation_id)
    if a.date != nil
      @date = a.date.to_s(:pretty_dt)
    end
    @school = a.school
    @department = a.department
    @presentation_notes = a.notes
    @presentation_id = a.id
    @presenter_id = a.user_id
    c = User.find(@presenter_id)
    @presenter_name = c.first_name.to_s + " " + c.last_name.to_s
  else
    @presenter_name = "n/a"
    @presentation_id = "n/a"
  end

    observer_id = @observation.user_id
    b = User.find(observer_id)
    @observer_name = b.first_name.to_s + " " + b.last_name.to_s
  end

  def edit
    id = params[:id]
    @observation = Observation.find(id)
    if @observation.presentation_id != nil
      @presentation_id = @observation.presentation_id
      @presentation_edit = "/presentations/#{@presentation_id}/edit"
    else
      @presentation_id = "new"
    end
  end

  def update
    id = params[:id]
    observation_hash = params.delete('observation')
    @observation = Observation.find(id)
    @observation.presentation_id = observation_hash['presentation_id']
    @observation.user_id = observation_hash['user_id']
    @observation.notes = observation_hash['notes']
    if @observation.save
      redirect_to observation_path(@observation.id)
    end
  end

  def destroy
    id = params[:id]
    Observation.delete(id)
    flash[:notice] = "The observation was successfully deleted"
    redirect_to "/"
  end
end
