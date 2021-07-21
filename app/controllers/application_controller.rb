class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    before_action :authenticate_user!

    protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile])
  end
end
