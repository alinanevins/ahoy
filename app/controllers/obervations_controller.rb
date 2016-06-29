class ObervationsController < ApplicationController
  def index
    @observation = Observation.new
  end

  def create
    observation_hash = params.delete('observation_hash')
    a = Observation.new
    a.date = observation_hash['date']
    a.school = observation_hash['school']
    a.department = observation_hash['department']
    a.presentation_id = observation_hash['presentation_id']
    a.user_id = observation_hash['user_id']
    if a.save
      redirect_to observation_path(a.id)
    end
  end

  def new
    @observation = Observation.new
  end

  def show
    id = params[:id]
    @observation = Observation.find(id)
  end

  def edit
    id = params[:id]
    @observation = Observation.find(id)
  end

  def update
    id = params[:id]
    observation_hash = params.delete('observation')
    @observation = Observation.find(id)
    @observation.date = observation_hash['date']
    @observation.school = observation_hash['school']
    @observation.department = observation_hash['department']
    @observation.presentation_id = observation_hash['presentation_id']
    @observation.user_id = observation_hash['user_id']
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
