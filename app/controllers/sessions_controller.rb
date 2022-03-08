class SessionsController < ApplicationController 

    def new
    end

    def create 
        # find email
        user = User.find_by(email: params[:session][:email].downcase)
        # check if valid and compare password
        if user && user.authenticate(params[:session][:password])
            # setting session in browser
            session[:user_id] = user.id 
            flash[:success] = "You have Successfully Logged in"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Invalid Credentials"
            render 'new'
        end

    end

    def destroy 
        # setting session to nill
        session[:user_id] = nil
        flash[:success] = "You have successfully Logged out"
        redirect_to root_path
    end

end