class EndUsersController < ApplicationController
    def top
        @genres=Genre.all
        @items = Item.where(is_saled: true).order(created_at: "DESC").limit(4)
    end
    
    def show

    end

    def edit
        @end_user=current_end_user
    end

    def update
        @end_user=current_end_user
        if @end_user.update(end_user_params)
            redirect_to mypage_path
        else
            render :edit
        end
    end

    def unsubscribe_confirm

    end

    def unsubscribe
        current_end_user.update(is_deleted: true)
        redirect_to end_user_session_path
    end

    private
    
    def end_user_params
        params.require(:end_user).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :post_code, :address, :email, :phone_number)
    end
end
