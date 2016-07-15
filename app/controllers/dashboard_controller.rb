class DashboardController < ApplicationController
  def index
  end

  def consultation
    input = Consultation.all
    data = []
    input.each do |i|
      name = (i.user.first_name + " " +i.user.last_name) || ''
      data.push({
      'id'=>i.id,
      'consultant'=>name,
      'date'=>i.date,
      'focus'=>i.focus,
      'notes'=>i.link_to_notes
      })
    end
    render json: data
  end

  def documentation
  end


  def presentation
  end

  def transition
  end

  def badge
  end

end
