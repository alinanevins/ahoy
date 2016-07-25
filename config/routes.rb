Rails.application.routes.draw do

  get 'dashboard' => 'dashboard#index'
  get 'dashboard/Consultation' => 'dashboard#consultation'
  get 'dashboard/Documentation' => 'dashboard#documentation'
  get 'dashboard/Presentation' => 'dashboard#presentation'
  get 'dashboard/Transition' => 'dashboard#transition'
  get 'dashboard/Badge' => 'dashboard#badge'

  get 'badges/all'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'welcome#index'

  post '/consultations/:id/edit' => 'consultations#edit'
  post '/documentations/:id/edit' => 'documentations#edit'
  post '/faculties/:id/edit' => 'faculties#edit'
  post '/observations/:id/edit' => 'observations#edit'
  post '/presentations/:id/edit' => 'presentations#edit'
  post '/transitions/:id/edit' => 'transitions#edit'

  get '/presentations/all' => 'presentations#all'

  resources :users
  resources :consultations
  resources :faculties
  resources :documentations
  resources :observations
  resources :presentations
  resources :transitions


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
