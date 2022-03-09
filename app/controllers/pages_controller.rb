class PagesController < ApplicationController

    def home
        # go to article listing if logged in
        redirect_to articles_path if logged_in?
    end


    def about 
    end
end
