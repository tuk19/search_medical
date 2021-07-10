class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "プロフィール情報を更新しました"
      redirect_to edit_user_path(current_user)
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :image)
  end
end
