class BlogsController < ApplicationController
    def show
    
    end
    
    def index 
    
    end 

    def create
    
    end

    def update
    
    end

    def destroy
    
    end

    private

    def blog_params
        params.permit(:title,:body,:user)
    end

end
