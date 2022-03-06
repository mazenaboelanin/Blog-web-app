class UsersController < ApplicationController 
    def index
    end

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(users_params)
        if @user.save 
            flash[:success] = "Welcome to alpha blog #{@user.username}"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])
        if @user.update(users_params)
            flash[:success] = "Your account was updated Successfully"
            redirect_to articles_path
        else
            render 'edit'
        end
    end


    private
    def users_params
        params.require(:user).permit(:username, :email, :password)
    end



end