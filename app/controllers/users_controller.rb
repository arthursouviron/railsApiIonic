class UsersController < ApplicationController

  def show
    @user = current_user
    render json: @user.to_json
  end


  def update_avatar
    @user = User.find_by_email(params[:user_email])
    if @user.update_attribute(:avatar, params[:avatar])
      render json: @user.avatar.url
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.permit(:avatar, :user_token, :user_email)
    end
end
