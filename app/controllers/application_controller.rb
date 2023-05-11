class ApplicationController < ActionController::API
    include ActionController::Cookies
    wrap_parameters format:[]
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def authorized
        return render json:{error:"Not authorized!"}, status: :unauthorized
        unless session.include? :user_id
        end
    end

    def render_unprocessable_entity(invalid)
        render json:{error:invalid.record.errors.full_messages}  ,status: :unprocessable_entity
    end
end
