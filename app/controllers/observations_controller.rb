class ObservationsController < ApplicationController
  def index
    @observation = Observation.all
  end

  def create
    observation_hash = params.delete('observation')
    @observation = Observation.new
    @observation.presentation_id = observation_hash['presentation_id']
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

    a = Presentation.find(presentation_id)

    @date = a.date
    @school = a.school
    @department = a.department

    observer_id = @observation.user_id
    b = User.find(observer_id)
    @observer_name = b.first_name.to_s + " " + b.last_name.to_s

    @presenter_id = a.user_id
    c = User.find(@presenter_id)
    @presenter_name = c.first_name.to_s + " " + c.last_name.to_s
  end

  def edit
    id = params[:id]
    @observation = Observation.find(id)
  end

  def update
    id = params[:id]
    observation_hash = params.delete('observation')
    @observation = Observation.find(id)
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
