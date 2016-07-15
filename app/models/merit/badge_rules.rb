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
    attr_accessor :badge_values
    include Merit::BadgeRulesMethods
    def initialize
      #Presentation Badges
      @badge_values = { 'Consult Ninja' => 20,
                        '10 Consultations'=> 10,
                        '5 Consultations' => 5,
                        '1 Consultation' => 1,
                        'Transition Ninja' => 375,
                        '85 Transitions'=> 85,
                        '20 Transitions' => 20,
                        '1 Transition' => 1,
                        'Document Ninja' => 12,
                        '6 Documents' => 6,
                        '3 Documents' => 3,
                        '1 Document' => 1,
                        'Observation Ninja' => 45,
                        '18 Observations' => 18,
                        '7 Observations'=>7,
                        '1 Observation'=>1,
                        'Presenter Ninja' => 45,
                        '18 Presentations' => 18,
                        '7 Presentations'=>7,
                        '1 Presentation'=>1
                      }

      grant_on 'presentations#create', badge_id: 1, badge: "1 Presentation", level: 1,  to: :user, temporary: true do |presentation|
        presentation.user.presentations.count >= @badge_values['1 Observation']
      end
      grant_on 'presentations#create', badge_id: 2, badge: "7 Presentations", level: 2,  to: :user, temporary: true do |presentation|
        presentation.user.presentations.count >= @badge_values['7 Presentations']
      end
      grant_on 'presentations#create', badge_id: 3, badge: "18 Presentations", level: 3,  to: :user, temporary: true do |presentation|
        presentation.user.presentations.count >= @badge_values['18 Presentations']
      end
      grant_on 'presentations#create', badge_id: 4, badge: "Presenter Ninja", level: 4,  to: :user, temporary: true do |presentation|
        presentation.user.presentations.count >= @badge_values['Presenter Ninja']
      end
      #Observation Badges
      grant_on 'observations#create', badge_id: 5, badge: "1 Observation", level: 1,  to: :user, temporary: true do |observation|
        observation.user.observations.count >= @badge_values['1 Observation']
      end
      grant_on 'observations#create', badge_id: 6, badge: "7 Observations", level: 2,  to: :user, temporary: true do |observation|
        observation.user.observations.count >= @badge_values['7 Observations']
      end
      grant_on 'observations#create', badge_id: 7, badge: "18 Observations", level: 3,  to: :user, temporary: true do |observation|
        observation.user.observations.count >= @badge_values['18 Observations']
      end
      grant_on 'observations#create', badge_id: 8, badge: "Observation Ninja", level: 4,  to: :user, temporary: true do |observation|
        observation.user.observations.count >= @badge_values['Observation Ninja']
      end
      #Documentation Badges
      grant_on 'documentations#create', badge_id: 9, badge: "1 Document", level: 1,  to: :user, temporary: true do |documentation|
        documentation.user.documentations.count >= @badge_values['1 Document']
      end
      grant_on 'documentations#create', badge_id: 10, badge: "3 Documents", level: 2,  to: :user, temporary: true do |documentation|
        documentation.user.documentations.count >= @badge_values['3 Documents']
      end
      grant_on 'documentations#create', badge_id: 11, badge: "6 Documents", level: 3,  to: :user, temporary: true do |documentation|
        documentation.user.documentations.count >= @badge_values['6 Documents']
      end
      grant_on 'documentations#create', badge_id: 12, badge: "Document Ninja", level: 4,  to: :user, temporary: true do |documentation|
        documentation.user.documentations.count >= @badge_values['Document Ninja']
      end
      #Consultation Badges
      grant_on 'consultations#create', badge_id: 13, badge: "1 Consultation", level: 1, to: :user, temporary: true do |consultation|
        consultation.user.consultations.count >= @badge_values['1 Consultation']
      end
      grant_on 'consultations#create', badge_id: 14, badge: "5 Consultations", level: 2,  to: :user, temporary: true do |consultation|
        consultation.user.consultations.count >= @badge_values['5 Consultations']
      end
      grant_on 'consultations#create', badge_id: 15, badge: "10 Consultations", level: 3,  to: :user, temporary: true do |consultation|
        consultation.user.consultations.count >= @badge_values['10 Consultations']
      end
      grant_on 'consultations#create', badge_id: 16, badge: "Consult Ninja", level: 4,  to: :user, temporary: true do |consultation|
        consultation.user.consultations.count >= @badge_values['Consult Ninja']
      end
      #Transition Badges
      grant_on 'transitions#create', badge_id: 17, badge: "1 Transition", level: 1, to: :user, temporary: true do |transition|
        transition.user.transitions.count >= @badge_values['1 Transition']
      end
      grant_on 'transitions#create', badge_id: 18, badge: "20 Transitions", level: 2,  to: :user, temporary: true do |transition|
        transition.user.transitions.count >= @badge_values['20 Transitions']
      end
      grant_on 'transitions#create', badge_id: 19, badge: "85 Transitions", level: 3,  to: :user, temporary: true do |transition|
        transition.user.transitions.count >= @badge_values['85 Transitions']
      end
      grant_on 'transitions#create', badge_id: 20, badge: "Transition Ninja", level: 4,  to: :user, temporary: true do |transition|
        transition.user.transitions.count >= @badge_values['Transition Ninja']
      end

      # samples
      # grant_on 'users/registrations#create', badge: 'create-account', model_name: 'User'
      # grant_on 'presentations#create', badge: "create-presentation", model_name: 'User'
      # grant_on 'users#show', badge_id: 4, badge: "create-presentations", model_name: 'User' do |user|
      #   user.presentations.count >= 9
      # end
      # grant_on 'presentations#create', badge_id: 5, badge: "create-11-presentations", level: 2,  to: :user, temporary: true do |presentation|
      #   
      #   presentation.user.presentations.count >= 23
      # end
      #

      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # Find badge by badge_id, badge_id takes presidence over badge
      # grant_on 'users#create', badge_id: 7, badge: 'just-registered', to: :itself

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', badge: 'commenter', level: 10 do |comment|
      #   comment.user.comments.count >= 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user, temporary: true do |comment|
      #
      #   comment.votes.count >= @easy_medium
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
