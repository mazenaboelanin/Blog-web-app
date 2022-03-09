class ArticlesController < ApplicationController
  # call set_article method before selected Methods
  before_action :set_article, only: [:edit, :update,:show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        # @articles = Article.all
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @article = Article.new
    end

    def edit 
        # @article = Article.find(params[:id])
    end


    def create 
        # To debug
        # debugger
        @article = Article.new(article_params)
        # hardcode user id now for test
        @article.user = current_user
        if @article.save
            flash[:notice] = 'Article is Successfully Created'
            redirect_to article_path(@article)
        else 
            render 'new'
        end
    end

    def update

        # @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = 'Article is Updated Successfully'
            redirect_to article_path(@article)
        else 
            render 'edit'
        end
    end


    def show 
        # @article = Article.find(params[:id])
    end

    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article has been Deleted Successfully"
        redirect_to articles_path
    end


    private
    def set_article
        @article = Article.find(params[:id])
    end
    def article_params
        params.require(:article).permit(:title, :description)
    end

    def require_same_user
        if current_user != @article.user
            flash[:danger] = "You can only edit or delete your own articles"
            redirect_to root_path
        end

    end

end