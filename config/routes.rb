ShoppingCart::Application.routes.draw do

  resources :users do
    collection do
      get :login
      put :update_password
      post :authenticate
      get :logout
      get :userprofilelist
      get :picture    
      
    end

    member do
      get :profile
      put :update_profile
      get :activate_user
    end

  end
  

  resources :categories do
    member do
      get :list
    end
  end


  resources :products do
    member do
      get :disp_products
      
    end
  end
  resources :carts



  resources :cart_items  do
    collection do
      post :delete_items
      
    end
    member do
      put :set_quantity
    end
  end
  resources :orders do
    member do
      put :update_profile
    end
  end
  resources :addresses
   
 
  
  resources :user_profiles, :has_many => :addresses



  match '/login' => 'users#login'
  match '/logout' => 'users#logout'
  match '/reset_password' => 'users#reset_password'
  match '/products' => 'products#index'
 

  match '/admin' => 'users#login'
  #match 'activate(/:activation_code)' => 'users#activate', :as => :activate_account
  #match 'send_activation(/:user_id)' => 'users#send_activation', :as => :send_activation
  namespace :admin do
    resources :users do
      collection do
        get :user_profile
        get :userprofilelist
      end
    end

    resources :products
    resources :categories
    resources :carts
    resources :cart_items

  end


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

  root :to => 'users#index'


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
