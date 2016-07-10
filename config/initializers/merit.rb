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
description: "Gave 1 Canvas @ Yale Presentation",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/313451354ea7525d6b4f0f5c85e64b52_13.png',
                requirement: 'Give 1 Canvas @ Yale Presentation',
                type: 'presentations'}
)
Merit::Badge.create!(
id: 2,
name: "7 Presentations",
level: 2,
description: "Gave 7 Canvas @ Yale Presentations",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/be1267cfa31532aa2e8b7bdbda9c2be1_15.png',
                  requirement: 'Give 7 Canvas @ Yale Presentations',
                  type:'presentations'}
)
Merit::Badge.create!(
id: 3,
name: "18 Presentations",
level: 3,
description: "Gave 18 Canvas @ Yale Presentations",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/7b854324a80e70a5b6758e285e09b43e_15.png',
                  requirement: 'Give 18 Canvas @ Yale Presentations',
                  type: 'presentations'}
)
Merit::Badge.create!(
id: 4,
name: "Presenter Ninja",
level: 4,
description: "Gave 45+ Canvas @ Yale Presentations",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/25a7bdd9ad910d76314e5cacb1dc20aa_15.png',
                  requirement: 'Give 45 Canvas @ Yale Presentations',
                  type: 'presentations'}
)
#Observation Badges
Merit::Badge.create!(
id: 5,
name: "1 Observation",
level: 1,
description: "Observed 1 Canvas @ Yale Presentation",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/886ca52dbd13a6345dd9c3fdfa3d9ef3_13.png',
                  requirement: 'Observe 1 Canvas @ Yale Observation',
                  type: 'observations'}
)
Merit::Badge.create!(
id: 6,
name: "7 Observations",
level: 2,
description: "Observed 7 Canvas @ Yale Presentations",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/aaf834be606f6ca94c5e05bbe9fa9f5d_15.png',
                  requirement: 'Observe 7 Canvas @ Yale Observations',
                  type: 'observations'}
)
Merit::Badge.create!(
id: 7,
name: "18 Observations",
level: 3,
description: "Observed 18 Canvas @ Yale Presentations",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/466e5a795fe3246e4581f87ff47fb77d_15.png',
                  requirement: 'Observe 18 Canvas @ Yale Observations',
                  type: 'observations'}
)
Merit::Badge.create!(
id: 8,
name: "Observation Ninja",
level: 4,
description: "Observed 45+ Canvas @ Yale Presentations",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/32c20fbc11493c6bf1c727f6fc6d2ef2_13.png',
                  requirement: 'Observe 45+ Canvas @ Yale Observations',
                  type: 'observations'}
)
#Documentation Badges
Merit::Badge.create!(
id: 9,
name: "1 Document",
level: 1,
description: "Created 1 Canvas @ Yale Help Document",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/56fcb41cdccfb2c51a85f2fb1d7fc553_15.png',
                  requirement: 'Create 1 Canvas @ Yale Help Document',
                  type: 'documentations'}
)
Merit::Badge.create!(
id: 10,
name: "3 Documents",
level: 2,
description: "Created 3 Canvas @ Yale Help Documents",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/4308e5f46c7624d861f56f123721c5f3_15.png',
                  requirement: 'Create 3 Canvas @ Yale Help Documents',
                  type: 'documentations'}
)
Merit::Badge.create!(
id: 11,
name: "6 Documents",
level: 3,
description: "Created 6 Canvas @ Yale Help Documents",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/42b0e3b13f261ede9ebe85eedaddf106_15.png',
                  requirement: 'Create 6 Canvas @ Yale Help Documents',
                  type: 'documentations'}
)
Merit::Badge.create!(
id: 12,
name: "Document Ninja",
level: 4,
description: "Created 12+ Canvas @ Yale Help Documents",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/f55dafd8a1437da9bc83b9f8ca2a2730_15.png',
                  requirement: 'Create 12+ Canvas @ Yale Help Documents',
                  type: 'documentations'}
)
#Consultation Badges
Merit::Badge.create!(
id: 13,
name: "1 Consultation",
level: 1,
description: "Performed 1 Canvas @ Yale Consultation",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/12ae28b8a3661371266e640767b8dc74_13.png',
                  requirement: 'Perform 1 Canvas @ Yale Consultation',
                  type: 'consultations'}
)
Merit::Badge.create!(
id: 14,
name: "5 Consultations",
level: 2,
description: "Performed 5 Canvas @ Yale Help Consults",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/16ebb219acbd7bd1a84f547a1bf174c4_13.png',
                  requirement: 'Perform 5 Canvas @ Yale Consultations',
                  type: 'consultations'}
)
Merit::Badge.create!(
id: 15,
name: "10 Consultations",
level: 3,
description: "Performed 10 Canvas @ Yale Consultations",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/c69bab5592e2d9403fec9730eeade746_13.png',
                  requirement: 'Perform 10 Canvas @ Yale Consultations',
                  type:'consultations'}
)
Merit::Badge.create!(
id: 16,
name: "Consult Ninja",
level: 4,
description: "Performed 20+ Canvas @ Yale Help Consults",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/f6126a89a977d5b58e4c61e861307425_15.png',
                  requirement: 'Perform 20+ Canvas @ Yale Consultations',
                  type: 'consultations'}
)
#Transition Badges
Merit::Badge.create!(
id: 17,
name: "1 Transition",
level: 1,
description: "Migrated 1 Canvas @ Yale Course",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/c42d88fd831604a89d0ecdb30e820285_15.png',
                  requirement: 'Migrate 1 Canvas @ Yale Course',
                  type: 'transitions'}
)
Merit::Badge.create!(
id: 18,
name: "20 Transitions",
level: 2,
description: "Migrated 20 Canvas @ Yale Courses",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/ca38b63e1260561a0a373960ce82017f_15.png',
                  requirement: 'Migrate 20 Canvas @ Yale Course',
                  type: 'transitions'}
)
Merit::Badge.create!(
id: 19,
name: "85 Transitions",
level: 3,
description: "Migrated 85 Canvas @ Yale Courses",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/1b7d658467887d25aa9fcbb2ace5dc8e_15.png',
                  requirement: 'Migrate 85 Canvas @ Yale Course',
                  type: 'transitions'}
)
Merit::Badge.create!(
id: 20,
name: "Transition Ninja",
level: 4,
description: "Migrated 375+ Canvas @ Yale Courses",
custom_fields: { image: 'https://credlyapp.s3.amazonaws.com/badges/668b4e8892a72e454997829437405e6c_15.png',
                  requirement: 'Migrate 375+ Canvas @ Yale Course',
                  type: 'transitions'}
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
