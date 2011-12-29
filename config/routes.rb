OrchiveApp::Application.routes.draw do	
  resources :preferences

  devise_for :linked_accounts

  resources :comments

    devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "join" }, :controllers => {:registrations => 'users/registrations', :sessions=> 'users/sessions', :passwords=>'users/passwords'}
	
	resources :beta_pages
	resources :pages
	
	resources :users do
		resources :comments
		resources :posts
    resources :preferences
    member do 
      get :following, :followers
    end 
    
	end
  
  resources :preferences do 
    collection do
      post "tag_with"
      post "clear_tag_list_and_preferences"
      post "make_feed_preference"    
    end
  end
	
	resources :posts do
    resources :comments
    
    collection do
    post "vote_up"
    post "vote_down"
    end
    
    #Jon's modifications
    #match "vote_up", :on => :collection
    #match "vote_down", :on => :collection
    #post 'vote_up', :on => :member
    #post 'vote_down', :on => :collection
    
#       member do
#       post 'vote_up'
#       delete 'destroy'
#    end
  end
  
  resources :comments do
     collection do
      post "vote_up"
      post "vote_down"
      post "reply"
      end
  end
  
          
  #map.connect '/posts/vote_up', :controller => 'posts', :action => 'vote_up'
  #map.connect '/posts/vote_down', :controller => 'posts', :action => 'vote_down'
  #^jon's vote routing  
  

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
	root :to => 'beta_pages#index'
	  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  
  match '/contact' => 'Pages#Contact'
  match '/about' => 'Pages#About'
  match '/help' => 'Pages#Help'
  match '/command' => 'Pages#Command'
  match '/privacy' => 'Pages#Privacy'
  match '/terms' => 'Pages#Terms'
  match '/future' => 'Pages#Future'
  match '/FAQ' => 'Pages#FAQ'
  match '/dashboard' => 'users#adminUI'

  
end