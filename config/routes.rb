Site::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :friends

  resources :messengers

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  
  get '/users/show_friends' => 'users#show_friends'
  match '/users/destroy_friends' => 'users#destroy_friends'
  match '/users/info/' => 'users#info'
  
  match 'items/byCollection/:id' => 'items#showbyid'
  resources :items

  resources :photos

  resources :administrations

  resources :searchadvanced

  resources :categories

  #match 'collections/byUserMail/:email' => 'collections#showbymail', :email => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  match 'collections/byUserMail/:email' => 'collections#showbymail', :constraints => { :email => /[^\/]*/ }
  match 'collections/byUser/:id' => 'collections#showbyuser'
  match 'collections/byCategory/:name' => 'collections#showbyname'
  match 'collections/searchadvanced' => 'collections#searchadvanced'

  
  get '/invite/create' => 'invite#create'
  get '/invite/show' => 'invite#show'
  get '/invite/accept' => 'invite#accept'
  get '/invite/deny' => 'invite#deny'
  resources :collections

  #get "home/index"

  #resources :categories

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:

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
  root :to => 'collections#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
