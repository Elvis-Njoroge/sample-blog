class CommentsController < ApplicationController

  # GET /comments
  def index
    comments = Comment.all
    render json: comments , status: :ok
  end

  # GET /comments/1
  def show
    comment = find_comment
    if comment
      render json: comment, status: :ok
    else
      render_record_not_found
    end
  end

  # POST /comments
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: "SUCCESS", message: "Comment was created successfully!", status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    comment = find_comment
    if comment
      comment.update!(comment_params)
      render json: comment, message: "Comment was updated successfully", status: :ok
    else
      render_unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    comment = find_comment
    if comment 
      comment.destroy!
      render json: {message: "Comment was deleted successfully"}, status: :no_content
    else
      render json: {error: "Comment does not exist"}, status: :bad_request
    end 
  end

  private
    
    def find_comment
      comment = Comment.find_by(id: params[:id])
    end


    def comment_params
      params.permit(:body, :user_id, :blog_id)
    end

    def render_record_not_found
      render json: { error: 'Comment not found' }, status: :not_found
    end

end
