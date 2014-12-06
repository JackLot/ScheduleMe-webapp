ScheduleMeWebapp::Application.routes.draw do
  
  resources :schedules


  get "welcome/index"
  #root 'welcome#index'

  resources :groups
  resources :users
  resources :memberships

  # Endpoints for android app. Respond with JSON

  # Users model endpoints
  match '/find_user', :to => 'users#find', via: :get, :constraints => {:format => /(json)/}
  match '/add_user', :to => 'users#add', via: :get, :constraints => {:format => /(json)/}
  match '/login', :to => 'users#login', via: :get, :constraints => {:format => /(json)/}
  match '/edit_user', :to => 'users#update_user', via: :get, :constraints => {:format => /(json)/}
  match '/get_groups', :to => 'users#getgroups'

  # Groups
  match '/add_group', :to => 'groups#add'
  match '/get_users', :to => 'groups#getusers'
  match '/get_group_calendar', :to => 'groups#calendar'

  # New Military Recruits
  match '/join_military', :to => 'memberships#add'

  # Schedule model endpoints
  match '/add_class', :to => 'schedules#add', via: :get, :constraints => {:format => /(json)/}

  match '/get_calendar', :to => 'calendar#show' #HTML rendering of students schedule

  # Calendar endpoint for rendering schedules
  match '/calendar', :to => 'calendar#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
