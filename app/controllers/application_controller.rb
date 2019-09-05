class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [ :name, :surname, :CF, :sex, :birth_place, :birth_date, :email, :password, roles:[] ] 

    if params[:action] == 'create'
      devise_parameter_sanitazer.for(sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end

end
