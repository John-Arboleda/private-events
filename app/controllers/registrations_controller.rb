class RegistrationsController < Devise::RegistrationsController
  private
  
  def sign_up_params
    params.requiere(:user.permit(:username, :email, :password, :password_confirmation))
  end
end
