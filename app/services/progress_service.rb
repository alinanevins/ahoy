class ProgressService
  def self.calc(user,badge_id)
    badge_values = Merit::BadgeRules.new.badge_values
    type_badge = Merit::Badge.find(badge_id).custom_fields[:type]
    num = user.send type_badge
    num = num.count
    den = badge_values[Merit::Badge.find(badge_id).name].to_f
    percent = num/den * 100
    # binding.pry
    percent = [percent.to_i,den.to_i,num.to_i]
  end
end
