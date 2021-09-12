class ApplicationController < ActionController::Base
    # ログインしていない場合はabout画面のみ
    before_action :authenticate_user!,except: [:about]

    before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # サインイン時は名前も追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # ログアウト後アバウト画面へ 
  def after_sign_out_path_for(resource)
    home_about_path
  end

end
