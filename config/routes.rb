Rails.application.routes.draw do
  
  #publicのaddress
  resources :addresses,only:[:index,:edit,:create,:update,:destroy]


  #publicのcar_item
  delete "/cart_items/destroy_all"=>"cart_items#destroy_all" ,as: "cart_item_destroy_all"
  resources :cart_items,only:[:index,:update,:destroy,:create]

  #pubicのitem
  resources :items,only:[:index,:show]

  namespace :admin do
    get 'homes/top'
    resources :end_users,only:[:index, :show, :edit, :update]
    resources :genres,only:[:index, :create, :edit, :update]
    resources :items,only:[:index, :new, :create, :show, :edit, :update]
  end
  #devise_for :admins
  #devise_for :end_users
  #今回はdeviseのcontrollerを作成したのでどのcontrollerをどのURLに適応させるのか記述する必要がある？

  root to: "end_users#top"
  get "/about"=>"homes#about"

  #end_users

  get "/end_users/mypage"=>"end_users#show" , as: "mypage"
  get "/end_users/information/edit"=>"end_users#edit",as: "edit_end_user"
  patch "/end_users/information"=>"end_users#update"
  get "/end_users/unsubscribe_confirm"=>"end_users#unsubscribe_confirm"
  patch "/end_users/unsubscribe"=>"end_users#unsubscribe"


  #顧客用
  devise_for :end_users, controllers: {
    registrations: 'end_user/registrations',
    sessions: 'end_user/sessions'
  }

  #管理者用
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get "/"=>"homes#top" ,as: "top"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
