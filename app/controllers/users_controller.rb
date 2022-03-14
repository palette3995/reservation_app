class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    @users = User.all
  end

  def edit
    @user =User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(params.require(:user).permit(:avatar, :name, :profile))
        flash[:notice] = "ユーザー情報を更新しました"
        redirect_to action: :edit
      else
        render "edit"
      end
  end

end
