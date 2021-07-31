class UsersController < ApplicationController
  PER = 2
  def show
    @user = User.find(params[:id])
    @users = current_user
    @fashion = @user.fashions.all.order(created_at: :desc).page(params[:page]).per(PER)
  end
end
