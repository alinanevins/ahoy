class FacultiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @faculty = Faculty.all
  end

  def create
    faculty_hash = params.delete('faculty')
    @faculty = Faculty.new
    @faculty.first_name = faculty_hash['first_name']
    @faculty.last_name = faculty_hash['last_name']
    @faculty.full_name = @faculty.first_name + " " + @faculty.last_name
    @faculty.email = faculty_hash['email']
    @faculty.phone = faculty_hash['phone']
    @faculty.school = faculty_hash['school']
    @faculty.department = faculty_hash['department']
    @faculty.notes = faculty_hash['notes']

    if @faculty.save
      redirect_to faculty_path(@faculty.id)
    end
  end

  def new
    @faculty = Faculty.new
  end

  def show
    id = params[:id]
    @faculty = Faculty.find(id)
  end

  def edit
    id = params[:id]
    @faculty = Faculty.find(id)
  end

  def update
    id = params[:id]
    faculty_hash = params.delete('faculty')
    @faculty = Faculty.find(id)
    @faculty.first_name = faculty_hash['first_name']
    @faculty.last_name = faculty_hash['last_name']
    @faculty.email = faculty_hash['email']
    @faculty.phone = faculty_hash['phone']
    @faculty.school = faculty_hash['school']
    @faculty.department = faculty_hash['department']
    @faculty.notes = faculty_hash['notes']
    if @faculty.save
      redirect_to faculty_path(@faculty.id)
    end
  end

  def destroy
    id = params[:id]
    Faculty.delete(id)
    flash[:notice] = "Faculty #{first_name.to_s + " " + last_name.to_s} was successfully deleted"
    redirect_to "/"
  end
end
