class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    before_action :find_user, only: [:show, :update, :destroy]
    wrap_parameters format:[]

  # GET /users
  def index
    users = User.all
    render json: users,  only:[:name, :email]
  end

  # GET /users/1
def show
  current_user = User.find(session[:user_id])
  render json: current_user,  only:[:name, :email]
end

  # POST /users
  def create
    user = User.create!(user_params)
    render json: user, only:[:name, :email], status: :created
  end

  # PATCH/users/1
  def update
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    user.destroy
  end

  # custom method to update blogs_counter for a user
  def update_blogs_counter
    user = User.find(params[:id])
    user.update_attribute(:blogs_counter, user.blogs.count)
    render json: user,  except:[:password_digest, :created_at, :updated_at]
  end

  private

    def find_user
      user = User.find(params[:id])
    end

   
    def user_params
      params.permit(:name, :email, :password)
    end

     def render_unprocessable_entity(invalid)
        render json:{error:invalid.record.errors.full_messages}  ,status: :unprocessable_entity
    end
end
