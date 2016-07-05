# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      #Presentation Badges
      @low = 3
      @medium = 5
      @high = 8
      grant_on 'presentations#create', badge_id: 1, badge: "1 Presentation", level: 1,  to: :user do |presentation|
        presentation.user.presentations.count == 1
      end
      grant_on 'presentations#create', badge_id: 2, badge: "3 Presentations", level: 2,  to: :user do |presentation|
        presentation.user.presentations.count == @low
      end
      grant_on 'presentations#create', badge_id: 3, badge: "5 Presentations", level: 3,  to: :user do |presentation|
        presentation.user.presentations.count == @medium
      end
      grant_on 'presentations#create', badge_id: 4, badge: "Presenter Ninja", level: 4,  to: :user do |presentation|
        presentation.user.presentations.count == @high
      end
      #Observation Badges
      grant_on 'observations#create', badge_id: 5, badge: "1 Observation", level: 1,  to: :user do |observation|
        observation.user.observations.count == 1
      end
      grant_on 'observations#create', badge_id: 6, badge: "3 Observations", level: 2,  to: :user do |observation|
        observation.user.observations.count == @low
      end
      grant_on 'observations#create', badge_id: 7, badge: "5 Observations", level: 3,  to: :user do |observation|
        observation.user.observations.count == @medium
      end
      grant_on 'observations#create', badge_id: 8, badge: "Observation Ninja", level: 4,  to: :user do |observation|
        observation.user.observations.count == @high
      end
      #Documentation Badges
      grant_on 'documentations#create', badge_id: 9, badge: "1 Document", level: 1,  to: :user do |documentation|
        documentation.user.documentations.count == 1
      end
      grant_on 'documentations#create', badge_id: 10, badge: "3 Documents", level: 2,  to: :user do |documentation|
        documentation.user.documentations.count == @low
      end
      grant_on 'documentations#create', badge_id: 11, badge: "5 Documents", level: 3,  to: :user do |documentation|
        documentation.user.documentations.count == @medium
      end
      grant_on 'documentations#create', badge_id: 12, badge: "Document Ninja", level: 4,  to: :user do |documentation|
        documentation.user.documentations.count == @high
      end
      #Consultation Badges
      grant_on 'consultations#create', badge_id: 13, badge: "1 Consult", level: 1, to: :user do |consultation|
        consultation.user.consultations.count == 1
      end
      grant_on 'consultations#create', badge_id: 14, badge: "3 Consults", level: 2,  to: :user do |consultation|
        consultation.user.consultations.count == @low
      end
      grant_on 'consultations#create', badge_id: 15, badge: "5 Consults", level: 3,  to: :user do |consultation|
        consultation.user.consultations.count == @medium
      end
      grant_on 'consultations#create', badge_id: 16, badge: "Consult Ninja", level: 4,  to: :user do |consultation|
        consultation.user.consultations.count == @high
      end

      # samples
      # grant_on 'users/registrations#create', badge: 'create-account', model_name: 'User'
      # grant_on 'presentations#create', badge: "create-presentation", model_name: 'User'
      # grant_on 'users#show', badge_id: 4, badge: "create-presentations", model_name: 'User' do |user|
      #   user.presentations.count == 9
      # end
      # grant_on 'presentations#create', badge_id: 5, badge: "create-11-presentations", level: 2,  to: :user do |presentation|
      #   binding.pry
      #   presentation.user.presentations.count == 23
      # end
      #

      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # Find badge by badge_id, badge_id takes presidence over badge
      # grant_on 'users#create', badge_id: 7, badge: 'just-registered', to: :itself

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', badge: 'commenter', level: 10 do |comment|
      #   comment.user.comments.count == 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user do |comment|
      #
      #   comment.votes.count == @medium
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', badge: 'autobiographer',
      #   temporary: true, model_name: 'User' do |user|
      #
      #   user.name.length > 4
      # end
    end
  end
end
