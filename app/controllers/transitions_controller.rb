class TransitionsController < ApplicationController
  def index
    @transition = Transition.all
  end

  def create
    transition_hash = params.delete('transition')
    a = Transition.new
    a.user_id = transition_hash['user_id']
    a.faculty_id = transition_hash['faculty_id']
    a.course = transition_hash['course']
    a.link = transition_hash['link']
    # date?
    if a.save
      redirect_to transition_path(a.id)
    end
  end

  def new
    @transition = Transition.new
  end

  def show
    id = params[:id]
    @transition = Transition.find(id)

    @userid = @transition.user_id
    a = User.find(@userid)
    @transitioner_name = a.first_name.to_s + " " + a.last_name.to_s

    @faculty_id = @transition.faculty_id
    b = Faculty.find(@faculty_id)
    @faculty_name = b.first_name.to_s + " " + b.last_name.to_s
  end

  def edit
    id = params[:id]
    @transition = Transition.find(id)
  end

  def update
    id = params[:id]
    transition_hash = params.delete('transition')
    @transition = Transition.find(id)
    @transition.user_id = transition_hash['user_id']
    @transition.faculty_id = transition_hash['faculty_id']
    @transition.course = transition_hash['course']
    @transition.link = transition_hash['link']
    if @transition.save
      redirect_to transition_path(@transition.id)
    end
  end

  def destroy
    id = params[:id]
    Transition.delete(id)
    flash[:notice] = "The transition was successfully deleted"
    redirect_to "/"
  end
end
