UpApp::Application.routes.draw do

  WepayRails.routes(self)

  resources :users do
    member do
      get :funding, :funders
    end
  end

  resources :users do
    match 'wepay_connect', :to => 'users#wepay_connect'
    match 'wepay_info', :to => 'users#wepay_info'
    match 'wepay_auth', :to => 'users#wepay_auth'
    match 'create_wepay_account', :to => 'users#create_wepay_account'
    match 'give', :to => 'users#give'
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :campaigns
  resources :gifts
  resources :relationships
  resources :authentications, only: [:index, :create, :destroy]


  root to: 'static_pages#home'

  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/aboutwebsite"
  get "static_pages/aboutcoops"
  get "static_pages/help"
  get "static_pages/startintro"
  get "static_pages/wepaysignup"
  get "static_pages/portal"
  get "campaigns/support"
  get "static_pages/wepay"
  



  match '/auth/:provider/callback' => 'authentications#create'
  match '/about',   to: 'static_pages#about'
  match '/aboutwebsite',   to: 'static_pages#aboutwebsite'
  match '/aboutcoops',   to: 'static_pages#aboutcoops'
  match '/help',   to: 'static_pages#help'
  match '/start', to: 'campaigns#new'
  match '/signup',  to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/startintro', to: 'static_pages#startintro'
  match '/campaignpage', to: 'campaigns#show'
  match '/addgifts', to: 'gifts#new'
  match '/portal', to: 'static_pages#portal'
  match '/wepaysignup', to: 'static_pages#wepaysignup'
  match '/wepay', to: 'static_pages#wepay'
  match '/thankyou', :to => 'relationships#thankyou'

 




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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
