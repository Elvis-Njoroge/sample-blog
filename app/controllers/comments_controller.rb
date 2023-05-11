class CommentsController < ApplicationController

  # GET /comments
  def index
    comments = Comment.all
    render json: comments , status: :ok
  end

  # GET /comments/1
  def show
    comment = find_comment
    render json: comment, status: :ok
  end

  # POST /comments
  def create
    comment = Comment.create!(blog_params)
    render json: comment, except:[:created_at, :updated_at], status: :created
  end

  # PATCH/PUT /comments/1
  def update
    comment = find_comment
    comment.update(blog_params)
    render json: comment, except:[:created_at, :updated_at], status: :ok
  end

  # DELETE /comments/1
  def destroy
    comment = find_comment 
    comment.blog.update_comments_counter
    comment.destroy
    
    head :no_content
  end

  private
    
    def find_comment
      comment = Comment.find(params[:id])
    end


    def comment_params
      params.require(:comment).permit(:body, :user_id, :blog_id)
    end

end
