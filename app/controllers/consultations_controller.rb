class ConsultationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @consultation = Consultation.all

    # faculty name autocomplete
    @availableFaculty = []

  end

  def create
    consultation_hash = params.delete('consultation')
    @consultation = Consultation.new
    @consultation.facultyname = consultation_hash['facultyname']
    @consultation.user_id = current_user.id
    @consultation.date = consultation_hash['date']
    @consultation.focus = consultation_hash['focus']
    @consultation.link_to_notes = consultation_hash['link_to_notes']
    if @consultation.save
      redirect_to consultation_path(@consultation.id)
    end

    # Faculty Name

    if @facultyname != nil
      @faculty_name_array = @facultyname.split(' ')
      @faculty_first_name = @faculty_name_array.first
      @faculty_last_name = @faculty_name_array.last

      @consultation.faculty_id = Faculty.where(full_name: @faculty_full_name).first_or_create do |faculty|
        faculty.first_name = @faculty_first_name
        faculty.last_name = @faculty_last_name

      end
    end

  end

  def new
    @consultation = Consultation.new

    # faculty name autocomplete
    @availableFaculty = []
    Faculty.all.each do |faculty|
      @facultyname = faculty.first_name + " " + faculty.last_name
      @availableFaculty << @facultyname
    end

  end

def show
  id = params[:id]
  @consultation = Consultation.find(id)

  @userid = @consultation.user_id
  a = User.find(@userid)
  @consultant_name = a.first_name.to_s + " " + a.last_name.to_s

  @faculty_id = @consultation.faculty_id
  if @faculty_id != nil && @faculty_id != 0
    b = Faculty.find(@faculty_id)
    @faculty_name = b.first_name.to_s + " " + b.last_name.to_s
  end

  # faculty name autocomplete
  @availableFaculty = []
end

def edit
  id = params[:id]
  @consultation = Consultation.find(id)
  # faculty name autocomplete
  @availableFaculty = []

  Faculty.all.each do |faculty|
    @facultyname = faculty.first_name + " " + faculty.last_name
    @availableFaculty << @facultyname
  end
end

def update
  id = params[:id]
  consultation_hash = params.delete('consultation')
  @consultation = Consultation.find(id)
  @consultation.faculty_id = consultation_hash['faculty_id']
  @consultation.user_id = consultation_hash['user_id']
  @consultation.date = consultation_hash['date']
  @consultation.focus = consultation_hash['focus']
  @consultation.link_to_notes = consultation_hash['link_to_notes']
  if @consultation.save
    redirect_to consultation_path(@consultation.id)
  end
end

def destroy
  id = params[:id]
  Consultation.delete(id)
  flash[:notice] = "Consultation #{id} was successfully deleted"
  redirect_to "/"
end
end
