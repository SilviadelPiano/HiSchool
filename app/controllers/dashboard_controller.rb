class DashboardController < ApplicationController

# ci arrivo anche dai login, quindi mi conviene fare la query

    def get
        if !user_signed_in?
            redirect_to user_session_path and return
        end
        @c_user = current_user
        if @c_user.blank?
            redirect_to user_session_path
        elsif @c_user.roles_mask == 1
            son_id = Child.find_by(parent_id: @c_user.id).child_id
            @son = User.find(son_id)
            render 'parent_dashboard'
        elsif @c_user.roles_mask == 2
            class_and_school = Membership.find_by(user_id: @c_user.id).schoolClass_id
            @school_class = SchoolClass.find(class_and_school)
            @school = School.find(@school_class.school_id)
            render 'student_dashboard'
        else 
            render 'teacher_dashboard'
        end
    end
        
end
