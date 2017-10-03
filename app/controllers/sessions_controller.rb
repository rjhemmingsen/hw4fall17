class SessionsController < ApplicationController
    
    def session_params
        params.require(:user).permit(:user_id, :email) 
    end
    
    def new
        #default for new
    end
    
    def create
        
        if User.find_by_user_id(session_params[:user_id]).blank?
            flash[:warning] = "The User ID could not be found"
            redirect_to login_path
        else
            if User.find_by_user_id(session_params[:user_id]).email != session_params[:email]
                flash[:warning] = "This email does not match with the associated User ID"
                redirect_to login_path
            else
                user = User.find_by_user_id(session_params[:user_id])
                session[:session_token] = user.session_token
                redirect_to movies_path
            end
        end
    end
    
    def destroy
        session.delete(:session_token)
        flash[:sucess] = "Log out successful"
        redirect_to movies_path
    end
end