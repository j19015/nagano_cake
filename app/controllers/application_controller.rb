class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    #user_signed_in?はユーザーがサインインしているかを確かめるためのメソッド
    #ログインしているときは毎回is_deletedの値を確認させ続ければいい。
    before_action :unsubscribe_end_user_confirm,  if: :end_user_signed_in?
    def after_sign_in_path_for(resource)
        if end_user_signed_in?
            mypage_path
        elsif admin_signed_in?
            admin_homes_top_path
        end
    end

    def after_sign_up_path_for(resource)
        mypage_path
    end

    def after_sign_out_path_for(resource)
        end_user_session_path
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number])
    end

    def unsubscribe_end_user_confirm
        #参考ページ https://qiita.com/mnooooooooo/items/c96d10032ec02a9e443c
        sign_out_and_redirect(current_end_user) if current_end_user.is_deleted
    end
    
end
