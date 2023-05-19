class BlogsController < ApplicationController
    # before_action :authenticate_user!, except: [:index, :show]
    before_action :find_blog, only: [:show, :update, :destroy]

    # GET /blogs
    def index
        blogs = Blog.all
        render json: blogs, include: :comments
    end

    # GET /blogs/1
    def show
        blog = find_blog
        render json: blog, include: :comments
    end

    # POST /blogs
    def create
        blog = Blog.create!(blog_params)
        after_save :update_posts_counter_add
        render json: blog
    end

    # PATCH/PUT /blogs/1
    def update
        blog = find_blog
        blog.update(blog_params)
        render json: blog, status: :ok
    end

    # DELETE /blogs/1
    def destroy
        blog = find_blog
        blog.comments.destroy_all
        blog.destroy

        head :no_content

    end

    private

    def find_blog
        blog = Blog.find(params[:id])
    end

   
    def blog_params
        params.permit(:title, :body, :user_id)
    end

end
