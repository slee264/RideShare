Rails.application.routes.draw do
<<<<<<< HEAD
  get 'static_pages/about'

  get 'static_pages/help'

  get 'static_pages/contact'

  get 'static_pages/faq'
=======
  get 'sessions/new'
>>>>>>> 08cb6b064ddc1e1e397fe812aea621190b6a0982

  # get 'users/' => 'users#create'

  # get 'users/show'

  # get 'users/update'

  # get 'users/destroy'
  
  resources :rides do
    match 'search', :to => 'rides#search', :via => :get, :on => :collection
  end
  
  resources :users do
   # get 'users/' => 'users#create'
  end
  
  root 'rides#index'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
<<<<<<< HEAD
  get '/faq', to: 'static_pages#faq'
  
=======

  match 'login', :to => 'sessions#new', :via => :get
  match 'login', :to => 'sessions#create', :via => :post
  match 'logout', :to => 'sessions#destroy', :via => :delete


>>>>>>> 08cb6b064ddc1e1e397fe812aea621190b6a0982
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
