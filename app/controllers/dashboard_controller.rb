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
            son_class_id = Membership.find_by(user_id: @son.id).schoolClass_id
            @posts = Post.where(school_class_id: son_class_id).limit(10) 
            render 'parent_dashboard'
        elsif @c_user.roles_mask == 2
            class_and_school = Membership.find_by(user_id: @c_user.id).schoolClass_id
            @school_class = SchoolClass.find(class_and_school)
            @school = School.find(@school_class.school_id)
            @posts = Post.where(school_class_id: @school_class.id).limit(10) 
            render 'student_dashboard'
        else 
            @posts = Post.joins("INNER JOIN school_classes_teachers ON school_classes_teachers.school_class_id = posts.school_class_id").where("school_classes_teachers.teacher_id" => @c_user.id).limit(10)
            render 'teacher_dashboard'
        end
    end
        
end
