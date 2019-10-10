require 'rails_helper'
require 'spec_helper'

RSpec.feature "user_logs_in" do 
    before do
        Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
         #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google]

         @user1 = create(:user, name: "Clara", 
                                surname: "Schiaccianoci", 
                                CF: "SCHCLR80B53H501B", 
                                email: "clara@gmail.com",
                                password: "*Clara444",
                                password_confirmation: "*Clara444")

        @school = create(:school)
        @school_class = create(:schoolClass)
        @membership = Membership.create({:user_id => @user1.id, :schoolClass_id => "1"})


    end

    scenario "using_google_oauth" do 
        visit '/users/sign_in'
        expect(page).to have_link("Login con Google")
        click_link "Login con Google"
        expect(page).to have_link("Logout")
    end 
end
