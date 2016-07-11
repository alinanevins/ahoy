class BadgesController < ApplicationController
  before_action :authenticate_user!

  def all
    @badge_status =[]
    current_user.badges.each do |x|
        @badge_status << x.id
    end

  end
end
