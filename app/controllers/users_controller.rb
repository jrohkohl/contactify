class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    if params[:username]
      @user = User.find_by!(username: params.fetch(:username))
    else
      @user = current_user
    end
  end
end

