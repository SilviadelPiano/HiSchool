class HomeController < ApplicationController
  def index
  end

  def school_class_new
    if !user_signed_in?
      redirect_to user_session_path
    end
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
    if u_role == 2
      if !c_id.present? 
        render :action => :school_class_new
      end
      Membership.create({:user_id => u_id, :schoolClass_id => c_id.id})
      redirect_to '/dashboard'
    elsif u_role == 4
      if !c_id.present? 
        render :action => :school_class_new
      end
      SchoolClassTeacher.create({:school_class_id => c_id.id, :teacher_id => u_id, :subject => params[:school_class_new_subject]})
      redirect_to '/dashboard'
    else 
      son_cf = params[:school_class_new_son]
      if !son_cf.present?
        render :action => :school_class_new
      else
        son_table = User.find_by(CF: son_cf)
        if (!son_table) || (son_table.CF == current_user.CF) || (son_table.roles_mask != 2)
          render :action => :school_class_new
        else  
          childr = Child.where(parent_id: u_id, child_id: son_table.id)
          if !childr.present?
            Child.create({:parent_id => u_id, :child_id => son_table.id}) # da testare ancora
            redirect_to '/dashboard'
          else 
            redirect_to '/dashboard'
          end
        end
      end
    end
  end

end
