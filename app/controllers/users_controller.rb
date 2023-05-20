class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  # GET /users
  def index
    users = User.all
    render json: users
  end

  # GET /users/1
def show
    user = find_user
    if user
      render json: user, include: :blogs,  state: :ok
    else
      render_record_not_found
    end
end


# show the logged in user
    # def current_user
    #     current_user = User.find(session[:user_id])
    #     render json: current_user
    # end

  # POST /users
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :ok, message: "User was created successfully!"
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/users/1
  def update
    user = find_user
    if user
      user.update!(user_params)
      render json: user, message: "User was updated successfully", status: :ok
    else
      render json: {message: "User cannot be updated"}, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    user= find_user
    if user 
      user.destroy!
      render json: {message: "User was deleted successfully"}, status: :ok
    else
      render json: {error: "User does not exist"}, status: :bad_request
    end
  end

  private

    def find_user
      User.find_by(id: params[:id])
    end
   
    def user_params
      params.permit(:name, :email, :password)
    end

    def render_record_not_found
      render json: { error: 'User not found' }, status: :not_found
    end
end
