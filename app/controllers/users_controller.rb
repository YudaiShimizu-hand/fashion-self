class UsersController < ApplicationController
  PER = 2
  PE = 4
  def show
    @user = User.find(params[:id])
    @users = current_user
    @fashion = @user.fashions.all.order(created_at: :desc).page(params[:page]).per(PER)
  end

  def following
    #@userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
end

def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
end

def following_fashions
  @user = current_user
  @users = @user.following.order(created_at: :desc).page(params[:page]).per(PE)
  @fashions = Fashion.where(user_id: @users.ids).order("created_at DESC")
end

end
