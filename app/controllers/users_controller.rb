class UsersController < ApplicationController

  # GET /users
  def index
    users = User.all
    render json: users
  end

  # GET /users/1
def show
    user = find_user
    render json: user
end


# show the logged in user
    def current_user
        current_user = User.find(session[:user_id])
        render json: current_user
    end

  # POST /users
  def create
    user = User.create!(user_params)
    render json: user, status: :created
  end

  # PATCH/users/1
  def update
    user = find_user
    user.update(user_params)
    render json: user, status: :ok
  end

  # DELETE /users/1
  def destroy
    user= find_user
    user.comments.destroy_all
    user.blogs.destroy_all
    user.destroy
  end

  # custom method to update blogs_counter for a user
  def update_blogs_counter
    user = User.find(params[:id])
    user.update_attribute(:blogs_counter, user.blogs.count)
    render json: user
  end

  private

    def find_user
      user = User.find(params[:id])
    end

   
    def user_params
      params.permit(:name, :email, :password)
    end
end
