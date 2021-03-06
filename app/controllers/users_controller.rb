class UsersController < ApplicationController 

    # call set_user before edit,update, show actions
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update]
    before_action :require_admin, only: [:destroy]
    def index
        @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 2)
    end

    def new 
        @user = User.new
    end

    def show 
        # @user = User.find(params[:id])
        @user_articles = @user.articles.paginate(page: params[:page], per_page: 2)
    end

    def destroy 
        @user = User.find(params[:id])
        if @user.destroy 
            flash[:danger] = "User and all articles created by user have been deleted"
            redirect_to users_path
        end
    end
    
    def create 
        @user = User.new(users_params)
        if @user.save 
            session[:user_id] = @user.id
            flash[:success] = "Welcome to alpha blog #{@user.username}"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def edit 
        # @user = User.find(params[:id])
    end

    def update 
        # @user = User.find(params[:id])
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

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user and !current_user.admin?
            flash[:dangers] = "You can only edit your own account"
            redirect_to root_path
        end
    end

    def require_admin
        # check if admin
        if logged_in? and !current_user.admin? 
            flash[:danger] = "only admin user can perform that action"
            redirect_to root_path
        end
    end



end