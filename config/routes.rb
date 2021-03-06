
Genericcmsdev::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :authentications
  resources :tables  
  resources :columns    
  resources :rows      
  devise_for :users, :path_names => { :sign_up => "signup", :sign_in => "signin" }, 
    :controllers => { :registrations => 'registrations' }

  # devise_for :tables, :controllers => { :tables => 'tables' }
  # devise_scope :table do 
  #   match 'tables' => 'devise/sessions#destroy' 
  # end

#  resources :users  # => , :authentications
  match 'auth/:provider/callback' => 'authentications#create'
  match 'auth/failure' => redirect('/')
  match 'sign_out' => 'authentications#destroy', :as => 'sign_out'

  match 'table/:tid/rows/show' => 'rows#show'
  match 'table/:tid/rows/new' => 'rows#new'  
#  match 'test_signout' => 'authentications#destroy'

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
   root :to => 'pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
