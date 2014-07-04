class UsersController < ApplicationController

  def show
    @user = current_user
    render json: @user.to_json
  end


  def update_avatar
    @user = current_user
    if @user.update(user_params)
      head :no_content
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:avatar)
    end
end
