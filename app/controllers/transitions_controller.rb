class TransitionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transition = Transition.all

    # faculty name autocomplete
    @availableFaculty = []
  end

  def create
    transition_hash = params.delete('transition')
    @transition = Transition.new
    @transition.user_id = current_user.id
    @transition.facultyname = transition_hash['facultyname']
    @transition.course = transition_hash['course']
    @transition.link = transition_hash['link']
    # date?
    if @transition.save
      redirect_to transition_path(@transition.id)
    end

    # Faculty Name
    if @transition.facultyname != nil
      @faculty_name_array = @transition.facultyname.split(' ')
      @faculty_first_name = @faculty_name_array.first
      @faculty_last_name = @faculty_name_array.last

      temp_faculty = Faculty.where(full_name: @transition.facultyname).first_or_create do |faculty|
        faculty.first_name = @faculty_first_name
        faculty.last_name = @faculty_last_name
      end
      @transition.faculty_id = temp_faculty.id
      @transition.save
    end
  end

  def new
    @transition = Transition.new

    @availableFaculty = []
    Faculty.all.each do |faculty|
      @facultyname = faculty.full_name
      @availableFaculty << @facultyname
    end
  end

  def show
    id = params[:id]
    @transition = Transition.find(id)

    @userid = @transition.user_id
    a = User.find(@userid)
    @transitioner_name = a.first_name.to_s + " " + a.last_name.to_s

    @faculty_id = @transition.faculty_id
    if @faculty_id != nil && @faculty_id != 0
      b = Faculty.find(@faculty_id)
      @faculty_name = b.full_name
    end

    # faculty name autocomplete
    @availableFaculty = []
  end

  def edit
    id = params[:id]
    @transition = Transition.find(id)

    # faculty name autocomplete
    @availableFaculty = []
    Faculty.all.each do |faculty|
      @facultyname = faculty.full_name
      @availableFaculty << @facultyname
    end
  end

  def update
    id = params[:id]
    transition_hash = params.delete('transition')
    @transition = Transition.new
    @transition.user_id = current_user.id
    @transition.facultyname = transition_hash['facultyname']
    @transition.course = transition_hash['course']
    @transition.link = transition_hash['link']
    # date?
    if @transition.save
      redirect_to transition_path(@transition.id)
    end

    # Faculty Name
    if @transition.facultyname != nil
      @faculty_name_array = @transition.facultyname.split(' ')
      @faculty_first_name = @faculty_name_array.first
      @faculty_last_name = @faculty_name_array.last

      temp_faculty = Faculty.where(full_name: @transition.facultyname).first_or_create do |faculty|
        faculty.first_name = @faculty_first_name
        faculty.last_name = @faculty_last_name
      end
      @transition.faculty_id = temp_faculty.id
      @transition.save
    end
  end

  def destroy
    id = params[:id]
    Transition.delete(id)
    flash[:notice] = "The transition was successfully deleted"
    redirect_to "/"
  end
end
