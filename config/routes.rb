Rails.application.routes.draw do
  get 'events/index'

  get 'events/show'
  devise_for :admins, :skip => [:registrations]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations' }

  devise_scope :user do
    get '/confirmation-getting-started' => 'registrations#getting_started', as: 'confirmation_getting_started'
  end

  get 'ratings/new'

  get 'ratings/answer'

  get 'ratings/edit'

  get 'ratings/show'

  get 'comments/new'

  get 'comments/answer'

  get 'comments/edit'

  get 'comments/destroy'

  get 'comments/show'

  get 'comments/index'

  get 'videographies/index'

  get 'videographies/new'

  get 'videographies/answer'

  get 'videographies/destroy'

  get 'videos/destroy'

  get 'videos/new'

  get 'videos/answer'

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

  get '/index' => redirect('/')

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
  # resources :users
  # resources :sessions, only: [:new, :answer, :destroy]
  resources :events, only: [:index, :show]
  resources :portfolios
  resources :photos, only: [:destroy, :new, :create]
  resources :videos, only: [:destroy, :new, :create]
  resources :profiles
  resources :shootings, :videographies
  resources :comments, only: [:new, :create, :destroy]
  resources :ratings, only: [:new, :create, :edit]
  # match '/signup',  to: 'users#new',            via: 'get'
  # match '/signin',  to: 'sessions#new',         via: 'get'
  # match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/greeting', to: 'static_pages#greetings',     via: 'get', as: :greeting_user
  match '/catalog', to: 'static_pages#catalog',     via: 'get'
  match '/catalog', to: 'static_pages#catalog',     via: 'post'
  match '/about', to: 'static_pages#about',     via: 'get'
  match '/photofilter', to: 'static_pages#photofilter', via: 'post'
  match '/photofilter', to: 'static_pages#catalog', via: 'get'
  match '/videofilter', to: 'static_pages#videofilter', via: 'post'
  match '/videofilter', to: 'static_pages#catalog', via: 'get'
  match '/new_shooting', to: 'portfolios#new_shooting', via: 'post'
  match 'portfolios/ratings/onPluginClick', to: 'ratings#onPluginClick', via: 'post'
  match 'portfolios/ratings/get_rating_info', to: 'ratings#get_rating_info', via: 'post'
  match '/edit_avatar', to: 'profiles#edit_avatar',  via: 'get', as: :edit_avatar
  match '/update_avatar', to: 'profiles#update_avatar',  via: 'patch', as: :update_avatar
  match '/upload_image', to: 'photos#upload',  via: 'post', as: :upload_image

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
