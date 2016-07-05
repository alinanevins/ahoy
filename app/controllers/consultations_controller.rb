class ConsultationsController < ApplicationController
  def index
    @consultation = Consultation.all
  end

  def create
    consultation_hash = params.delete('consultation')
    @consultation = Consultation.new
    @consultation.faculty_id = consultation_hash['faculty_id']
    @consultation.user = current_user
    @consultation.date = consultation_hash['date']
    @consultation.focus = consultation_hash['focus']
    @consultation.link_to_notes = consultation_hash['link_to_notes']
    if @consultation.save
      redirect_to consultation_path(@consultation.id)
    end

  end

  def new
    @consultation = Consultation.new
  end

  def show
    id = params[:id]
    @consultation = Consultation.find(id)

    @userid = @consultation.user_id
    a = User.find(@userid)
    @consultant_name = a.first_name.to_s + " " + a.last_name.to_s

    @faculty_id = @consultation.faculty_id
    b = Faculty.find(@faculty_id)
    @faculty_name = b.first_name.to_s + " " + b.last_name.to_s
  end

  def edit
    id = params[:id]
    @consultation = Consultation.find(id)
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
    flash[:notice] = "Consultation #{name} was successfully deleted"
    redirect_to "/"
  end
end
