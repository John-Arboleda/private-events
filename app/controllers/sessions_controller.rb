class SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  def destroy
    sign_out_and_redirect(current_user)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  end
end
