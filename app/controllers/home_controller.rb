class HomeController < ApplicationController
  def index
  end

  def school_class_new
    @user = current_user
  end

  def create
    if !current_user
      redirect_to user_session_path
    end
    u_id = current_user.id
    u_role = current_user.roles_mask
    c_name = params[:school_class_new_class]
    school_name = params[:school_class_new_school]
    s_id = School.where(name: school_name)
    c_id = SchoolClass.where(name: c_name, school_id: s_id).take
    if !c_id.present? 
      render :action => :school_class_new
    elsif u_role == 2
      Membership.create({:user_id => u_id, :schoolClass_id => c_id.school_id})
      redirect_to user_session_path
    elsif u_role == 4
      SchoolClassTeacher.create({:school_class_id => c_id.school_id, :teacher_id => u_id, :subject => params[:school_class_new_subject]})
      redirect_to user_session_path
    else 
      son_cf = params[:school_class_new_son]
      if !son_cf.present?
        render :action => :school_class_new
      else
        son_table = User.find_by(CF: son_cf)
        if !son_table || son_table.CF == current_user.CF || son_table.roles_mask != 2
          byebug
          render :action => :school_class_new
        else  
          childr = Child.where(parent_id: u_id, child_id: son_table.id)
          if !childr
            Child.create({:parent_id => u_id, :child_id => son_table.id}) # da testare ancora
            redirect_to user_session_path
          else 
            redirect_to user_session_path
          end
        end
      end
    end
  end

end
