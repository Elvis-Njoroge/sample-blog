class CommentsController < ApplicationController
      before_action :find_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      # update the comments_counter for the associated blog
      @comment.blog.update_comments_counter
      
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    
    @comment.blog.update_comments_counter
    @comment.destroy
    
    head :no_content
  end

  private
    
    def find_comment
      @comment = Comment.find(params[:id])
    end


    def comment_params
      params.require(:comment).permit(:body, :user_id, :blog_id)
    end

end
