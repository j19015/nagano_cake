Rails.application.routes.draw do
  #devise_for :admins
  #devise_for :end_users
  #今回はdeviseのcontrollerを作成したのでどのcontrollerをどのURLに適応させるのか記述する必要がある？

  #顧客用
  devise_for :end_users, controllers: {
    registrations: 'end_user/registretions',
    session: 'end_user/sessions'
  }

  #管理者用
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
