# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  TmpJob.perform_at(7.seconds.from_now)

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :request_service_owner, :permission_to_become_service_owner)
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end
  # def create
  #   super do |resource|
  #     resource.request_service_owner = params[:user][:request_service_owner] # Access the checkbox value here
  #
  #     # Custom code to handle the checkbox value
  #
  #     # Example: Perform some action based on checkbox value
  #     if resource.request_service_owner
  #       # Do something if the checkbox is checked
  #     else
  #       # Do something if the checkbox is not checked
  #     end
  #   end
  # end
  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def update_resource(resource, params)
    if resource.provider == 'google_oauth2'
      params.delete('current_password')
      resource.password = params['password']
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end
end
