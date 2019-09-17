class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  #after_action :pass_params, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end

  def configure_devise_permitted_parameters
    registration_params = [ :name, :surname, :CF, :sex, :birth_place, :birth_date, :email, :password, roles:[] ] 

    if params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end

  #def pass_params
   # @codice_fiscale = params[:CF]
    #@ruolo = params[:roles_mask]
  #end

end
