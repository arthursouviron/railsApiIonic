class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    render json: @user.to_json
  end

  def index
    @users = User.all
    render json: @users.to_json
  end


  def update_avatar
    @user = current_user
    if @user.update_attribute(:avatar, params[:avatar])
      render json: @user.avatar.url
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update_push_register_id
    @user = current_user
    if @user && @user.update_attribute(:register_id_token, params[:user][:register_id_token])
      render json: 'OK'
    else
      render json: @user.errors
    end
  end

  private
    def user_params
      params.permit(:avatar, :user_email, :register_id_token)
    end
end
