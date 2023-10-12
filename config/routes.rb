Rails.application.routes.draw do
  # Public routes for orders
  post "orders/confirm" => "orders#confirm", as: "orders_confirm"
  get "orders/complete" => "orders#complete", as: "orders_complete"
  resources :orders, only: [:index, :show, :create, :new]

  # Public routes for addresses
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  # Public routes for cart items
  delete "/cart_items/destroy_all" => "cart_items#destroy_all", as: "cart_item_destroy_all"
  resources :cart_items, only: [:index, :update, :destroy, :create]

  # Public routes for items
  get 'items/search' => "items#search", as: "genre_search"
  resources :items, only: [:index, :show]

  # Item search for admin
  namespace :admin do
    get 'items/search' => "items#search"
    get 'homes/top', as: "top"
    resources :order_details, only: [:update]
    resources :orders, only: [:index, :show, :update]
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  # Routes for end users
  root to: "end_users#top"
  get "/about" => "homes#about"
  get "/end_users/mypage" => "end_users#show", as: "mypage"
  get "/end_users/information/edit" => "end_users#edit", as: "edit_end_user"
  patch "/end_users/information" => "end_users#update"
  get "/end_users/unsubscribe_confirm" => "end_users#unsubscribe_confirm"
  patch "/end_users/unsubscribe" => "end_users#unsubscribe"

  # Devise routes for end users and admins
  devise_for :end_users, controllers: {
    registrations: 'end_user/registrations',
    sessions: 'end_user/sessions'
  }

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }
end
