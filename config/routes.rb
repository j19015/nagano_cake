Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  #devise_for :admins
  #devise_for :end_users
  #今回はdeviseのcontrollerを作成したのでどのcontrollerをどのURLに適応させるのか記述する必要がある？

  get "/"=> "end_users#top"
  get "/about"=>"homes#about"

  #end_users

  get "/end_users/mypage"=>"end_users#show" , as: "mypage"
  get "/end_users/information_edit"=>"end_users#edit"
  patch "/end_users/information"=>"end_users#update"
  get "/end_users/unsubcribe_confirm"=>"end_users#unsubscribe_confirm"
  patch "/end_users/unsubscribe"=>"end_users#unsubscribe"


  #顧客用
  devise_for :end_users, controllers: {
    registrations: 'end_user/registrations',
    session: 'end_user/sessions'
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
