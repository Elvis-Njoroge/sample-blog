class BlogsController < ApplicationController
    # GET /blogs
    def index
        blogs = Blog.all
        if blogs
            render json: blogs, include: :comments
        else
            render json: { error: 'Blogs not found' }, status: :not_found
        end
    end

    # GET /blogs/1
    def show
        blog = find_blog
        if blog
            render json: blog, include: :comments,  state: :ok
        else
            render_record_not_found
        end
    end

    # POST /blogs
    def create
        blog = Blog.new(blog_params)
        if blog.save
            render json: blog, status: "SUCCESS", message: "Blog was created successfully!", status: :created
        else
            render json: blog.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /blogs/1
    def update
        blog = find_blog
        if blog
            blog.update!(blog_params)
            render json: blog, message: "Blog was updated successfully", status: :ok
        else
            render json: {message: "Blog cannot be updated"}, status: :unprocessable_entity
        end
    end

    # DELETE /blogs/1
    def destroy
        blog = find_blog
        if blog
            blog.destroy!
            render json: {message: "Blog was deleted successfully"}, status: :no_content
        else
            render json: {message: "Blog does not exist"}, status: :bad_request
        end
    end

    private

    def find_blog
        blog = Blog.find_by(id: params[:id])
    end
   
    def blog_params
        params.permit(:title, :body, :user_id)
    end

    def render_record_not_found
      render json: { error: 'Blog not found' }, status: :not_found
    end

end
