require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

# Useful methods

def create_visitor
    @visitor ||= { :name => "Silvia",
                   :surname => "del Piano",
                   :roles_mask => "2",
                   :CF => "DLPSLV97L67H501J",
                   :birth_place => "Roma",
                   :sex => "F",
                   :email => "silvia.delpiano27@gmail.com",
                   :password => "*YukiShiro27",
                   :password_confirmation => "*YukiShiro27" }
  end
  
  
  def delete_user
    @user ||= User.where(:email => @visitor[:email]).first
    @user.destroy unless @user.nil?
  end
  
  def create_student
    create_visitor
    delete_user
    @user = FactoryBot.create(:user, @visitor)
    @school = FactoryBot.create(:school)
    @schoolClass = FactoryBot.create(:schoolClass)
    @member = Membership.create!({
               :user_id => @user.id,
               :schoolClass_id => "1"
             })
  end

  def create_teacher
    create_visitor
    @user = FactoryBot.create(:user, roles_mask: "4", CF: "PLLPNC80A12H501X", email: "silvia_teacher@gmail.com")
    @school = FactoryBot.create(:school)
    @schoolClass = FactoryBot.create(:schoolClass)
    @school_class_teacher = FactoryBot.create(:school_class_teacher, school_class_id: "1", teacher_id: @user.id)
  end 
  
  def sign_in
    visit '/users/sign_in'
    fill_in "user_email", :with => @visitor[:email]
    fill_in "user_password", :with => @visitor[:password]
    click_button "Log in"
  end

  Given /^I am logged in$/ do
    create_student
    sign_in
  end
  
  Given /^I am logged in and a student$/ do   # per chiarezza
    create_student
    sign_in
  end 
  
  Given /^a valid user$/ do
    create_student
  end

  Given /^a valid teacher is registered$/ do 
    create_teacher
  end
 
