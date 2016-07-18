class DashboardController < ApplicationController
  def index
  end

  def consultation
    input = Consultation.all
    data = []
    input.each do |i|
      name = (i.user.first_name + " " +i.user.last_name) || ''
      data.push([
      i.id,
      i.facultyname,
      name,
      i.date.to_s(:pretty_dt),
      i.focus,
      i.link_to_notes,
      i.created_at.to_s(:pretty_dt)
      ])
    end
    render json: data
  end

  def documentation
    input = Documentation.all
    data = []
    input.each do |i|
      name = (i.user.first_name + " " +i.user.last_name) || ''
      data.push([
      i.id,
      name,
      i.name,
      i.audience,
      i.link_to_documentation,
      i.created_at.to_s(:pretty_dt)
      ])
    end
    render json: data
  end


  def presentation
    input = Observation.all
    data = []
    input.each do |i|
      observer_first = i.user.first_name || ""
      observer_last = i.user.last_name || ""
      observer = observer_first + " " + observer_last
      presenter_first = i.presentation.user.first_name || ""
      presenter_last = i.presentation.user.last_name || ""
      presenter = presenter_first + " " + presenter_last
      data.push([
      i.presentation_id,
      i.id,
      i.presentation.date.to_s(:pretty_dt),
      presenter,
      observer,
      i.presentation.school,
      i.presentation.department,
      i.presentation.created_at.to_s(:pretty_dt)
      ])
    end
    render json: data
  end

  def transition
    input = Transition.all
    data = []
    input.each do |i|
      user_first = i.user.first_name || ""
      user_last = i.user.last_name || ""
      user = user_first + " " + user_last
      data.push([
      i.id,
      user,
      i.date.to_s(:pretty_dt),
      i.faculty.full_name,
      i.course,
      i.link,
      i.created_at.to_s(:pretty_dt)
      ])
    end
    render json: data

  end

  def badge
    data = []
    1.upto(20) do |i|
      users_array = users_with_badge_id(i)
      data.push([
      Merit::Badge.find(i).id,
      Merit::Badge.find(i).name,
      users_array.count
      ])
    end
    render json: data

  end

  private
  def users_with_badge_id(badge_id)
  sashes_with_badge = User::BadgesSash.where(badge_id: badge_id).pluck(:sash_id)
  User.where(sash_id: sashes_with_badge)
  end



end
