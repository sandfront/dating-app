class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(user)
    profile_onboard_path(user)
  end
end
