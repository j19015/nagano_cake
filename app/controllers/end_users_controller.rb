class EndUsersController < ApplicationController
    def top
        
    end
    def show

    end

    def edit
        @end_user=current_end_user
    end

    def update

    end

    def unsubscribe_confirm

    end

    def unsubscribe
        current_end_user.update(is_deleted: true)
        redirect_to end_user_session_path
    end
end
