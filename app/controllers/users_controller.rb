class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = current_user
  end
end
