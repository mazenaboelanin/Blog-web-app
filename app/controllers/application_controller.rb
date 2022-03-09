class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        # return current_user if exists, else retrieve it with its session
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        # return true or false
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:danger] = "You mist be logged in to perform that action"
            redirect_to root_path
        end
    end
end
