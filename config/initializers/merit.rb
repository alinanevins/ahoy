# Use this hook to configure merit parameters
Merit.setup do |config|
  config.checks_on_each_request = true
  config.user_model_name = 'User'
  config.current_user_method = 'current_user'
  config.add_observer 'ReputationChangeObserver'
end
#Presentation Badges
Merit::Badge.create!(
id: 1,
name: "1 Presentation",
level: 1,
description: "Gave 1 Canvas @ Yale Presentation"
)
Merit::Badge.create!(
id: 2,
name: "3 Presentations",
level: 2,
description: "Gave 3 Canvas @ Yale Presentation"
)
Merit::Badge.create!(
id: 3,
name: "5 Presentations",
level: 3,
description: "Gave 5 Canvas @ Yale Presentation"
)
Merit::Badge.create!(
id: 4,
name: "Presenter Ninja",
level: 4,
description: "Gave 8+ Canvas @ Yale Presentation"
)
#Observation Badges
Merit::Badge.create!(
id: 5,
name: "1 Observation",
level: 1,
description: "Gave 1 Canvas @ Yale Observation"
)
Merit::Badge.create!(
id: 6,
name: "3 Observations",
level: 2,
description: "Gave 3 Canvas @ Yale Observations"
)
Merit::Badge.create!(
id: 7,
name: "5 Observations",
level: 3,
description: "Gave 5 Canvas @ Yale Observations"
)
Merit::Badge.create!(
id: 8,
name: "Observation Ninja",
level: 4,
description: "Gave 8+ Canvas @ Yale Observations"
)

  # samples
  # Merit::Badge.create!(
  # id: 1,
  # name: "create-account",
  # level: 1,
  # description: "Create a new account"
  # )
  #
  # Merit::Badge.create!(
  # id: 2,
  # name: "first-presentation",
  # level: 1,
  # description: "Give your first presentation",
  # custom_fields: { type: :presentation }
  # )
  #
  # Merit::Badge.create!(
  # id: 3,
  # name: "create-presentation",
  # level: 1,
  # description: "Submit a presentation form"
  # )
  # Merit::Badge.create!(
  # id: 4,
  # name: "create-presentations",
  # level: 1,
  # description: "Submit 5 presentation forms"
  # )
  # Merit::Badge.create!(
  # id: 5,
  # name: "create-11-presentations",
  # level: 2,
  # description: "Submit 11 presentation forms"
  # )
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'


# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
