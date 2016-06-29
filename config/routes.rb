Rails.application.routes.draw do
  get 'shootings/index'

  get 'shootings/show'

  get 'shootings/destroy'

  get 'shootings/edit'

  get 'shootings/new'

  get 'profiles/show'

  get 'profiles/edit'

  get 'profiles/update'

  get 'profiles/destroy'

  get 'portfolios/show'

  get 'portfolios/destroy'

  get 'portfolios/edit'

  get 'portfolios/update'

  get 'photos/destroy'

  get 'portfolios/index'

  get 'portfolios/show'

  get 'static_pages/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'static_pages#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :portfolios
  resources :photos, only: [:destroy, :new, :create]
  resources :profiles
  resources :shootings
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/catalog', to: 'static_pages#catalog',     via: 'get'
  match '/filter', to: 'static_pages#filter', via: 'post'
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
