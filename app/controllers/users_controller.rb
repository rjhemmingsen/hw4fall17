class UsersController < ApplicationController
    
    def user_params
        params.require(:user).permit(:user_id,:email)
    end
    
    def new
         #default for new
    end
    
    def create 
        if User.find_by_user_id(session_params[:user_id]).blank?
            @user = User.create_user!(user_params)
            flash[:notice] = "Your account has been successfully created #{@user.user_id}"
            redirect_to login_path
        else
            flash[:warning] = "This User ID is unabavailable, please try again"
        end
        redirect_to login_path
    end
end