# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    if current_user.staffs.ids != @user.staffs.ids
      user_staff_path(@user.id, @user.staffs.ids)
    else
      user_path(id: current_user.id)
    end
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end

# /users/:user_id/staffs/:id(.:format)
