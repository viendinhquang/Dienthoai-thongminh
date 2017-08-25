Rails.application.routes.draw do
  get 'post/index'
  get 'post/contact'
  get 'errors/contact'

  get 'errors/not_found'

  resources :product
  # resources :posts


  # namespace :admin do
  # get 'type_colors/index'
  # end

  # namespace :admin do
  # get 'products/index'
  # end

  # namespace :admin do
  #   get 'users/index'
  # end

  # devise_for :users
  # devise_for :admins
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    # sessions: 'users/registrations'
  }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
  end

  namespace :admin do
    resources :users
    resources :products
    resources :type_colors
    resources :posts
  end

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  get 'home/index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  root to: 'admin_page#index', as: :admin_root
  get 'admin_page/index'
  get '/errors', to: 'errors#not_found'
  get '/contact', to: 'errors#contact'
  get "*path" => redirect("/errors")

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
