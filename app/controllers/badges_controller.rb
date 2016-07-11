class BadgesController < ApplicationController
  before_action :authenticate_user!

  def all
    @badge_status =[]
    current_user.badges.each do |x|
        @badge_status << x.id
    end
    @user=current_user
    @badge_values = Merit::BadgeRules.new.badge_values
  end
end


#    <!-- <% percent = progress_service.calc(@user,x) %> -->
#
      # <!-- name: <%= Merit::Badge.find(x).name %> -->
      # <!-- go through each badge: Merit::Badge.all.each do |x|
      # class for grayscale: missing_badge -->
