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

def create_visitor_teacher
  @visitor_teacher ||= { :name => "Silvia",
                   :surname => "del Piano",
                   :roles_mask => "1",
                   :CF => "CRUMRA81B56H501O",
                   :birth_place => "Roma",
                   :sex => "F",
                   :email => "silvia_teacher27@gmail.com",
                   :password => "*YukiShiro27",
                   :password_confirmation => "*YukiShiro27" }
end 

def create_visitor_parent
  @visitor_parent ||= { :name => "Silvia",
                   :surname => "del Piano",
                   :roles_mask => "2",
                   :CF => "PLLPNC80A12H501X",
                   :birth_place => "Roma",
                   :sex => "F",
                   :email => "marie@gmail.com",
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
  @student = FactoryBot.create(:user, @visitor)
  @school = FactoryBot.create(:school)
  @schoolClass = FactoryBot.create(:schoolClass)
  @member = Membership.create!({
              :user_id => @student.id,
              :schoolClass_id => "1"
            })
end

def create_teacher
  create_visitor_teacher
  @teacher = FactoryBot.create(:user, roles_mask: "4", CF: "PLLPNC80A12H501X", email: "silvia_teacher27@gmail.com")
  @school = FactoryBot.create(:school)
  @schoolClass = FactoryBot.create(:schoolClass)
  @school_class_teacher = FactoryBot.create(:school_class_teacher, teacher_id: @teacher.id)
end 

def create_parent
  create_student
  create_visitor_parent
  @parent = FactoryBot.create(:user, roles_mask: "1", CF: "CRUMRA81B56H501O", email: "marie@gmail.com")
  @parenthood = Child.create(parent_id: @parent.id, child_id: @student.id)
end 

def create_other_teacher
  @other_teacher = FactoryBot.create(:user, roles_mask: "4", CF: "PLLPNC83C14L378G", email: "pinco@gmail.com")
  @other_school_class_teacher = FactoryBot.create(:school_class_teacher, teacher_id: @other_teacher.id, subject: "Storia")
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Log in"
end

def sign_in_teacher
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor_teacher[:email]
  fill_in "user_password", :with => @visitor_teacher[:password]
  click_button "Log in"
end 

def sign_in_parent
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor_parent[:email]
  fill_in "user_password", :with => @visitor_parent[:password]
  click_button "Log in"
end 

def create_posts
  @ita_post = FactoryBot.create(:post, user_id: @teacher.id)
  @storia_post = FactoryBot.create(:post, description: "[Storia, 2LS, Peano] Studiate storia!\nPinco Pallo", user_id: @other_teacher.id)
end

Given /^I am logged in$/ do
  create_student
  sign_in
end

Given /^I am logged in and a student$/ do   # per chiarezza
  create_student
  sign_in
end 

Given /^I am logged in and a teacher$/ do 
  create_teacher
  sign_in_teacher
end

Given /^I am logged in and a parent$/ do 
  create_parent
  sign_in_parent
end

Given /^a valid user$/ do
  create_student
end

Given /^a valid teacher is registered$/ do 
  create_teacher
end

Given /^another teacher exists$/ do 
  create_other_teacher
end

Given /^I created a post$/ do
  create_posts
end

Given /^posts about the classroom of my child are created$/ do
  create_teacher
  create_other_teacher
  create_posts
end

Given /^posts about my classroom are created$/ do 
  create_teacher
  create_other_teacher
  create_posts
end


