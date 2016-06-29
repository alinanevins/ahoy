class FacultyController < ApplicationController
  def index
    @faculty = Faculty.all
  end

  def create
    faculty_hash = params.delete('faculty')
    a = Faculty.new
    a.name = faculty_hash['name']
    a.email = faculty_hash['email']
    a.phone = faculty_hash['phone']
    a.school = faculty_hash['school']
    a.department = faculty_hash['department']
    a.notes = faculty_hash['notes']
    if a.save
      redirect_to faculty_path(a.id)
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
    @faculty.name = faculty_hash['name']
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
    flash[:notice] = "Faculty #{name} was successfully deleted"
    redirect_to "/"
  end
end
