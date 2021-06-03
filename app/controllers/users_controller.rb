class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]
  before_action :ensure_current_user_is_owner, only: [:show]


  private
  # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end


    def ensure_current_user_is_owner
      if current_user != @user
        redirect_back fallback_location: root_url, alert: "You're not authorized for that."
      end
    end
end

