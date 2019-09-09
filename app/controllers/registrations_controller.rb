class RegistrationsController < Devise::RegistrationsController

  after_action :clear_signup_signout_flash, :only => [:create, :destroy]

  protected
  
    def after_sign_up_path_for(resource)
      '/home/school_class_new/'  
    end 

    def clear_signup_signout_flash
      if flash.key?(:notice)
        flash.delete(:notice)
      end
    end

  end 