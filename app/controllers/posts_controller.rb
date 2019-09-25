class PostsController < ApplicationController

    def def new
        if !user_signed_in?
            redirect_to user_session_path and return
        end

    end

    def create 
        if !user_signed_in?
            redirect_to user_session_path and return
        end

        teacher_id = current_user.id 
        s_name = params[:school]
        s_id = School.find_by(name: s_name)
        sc_name = params[:school_class]
        school_class = SchoolClass.where(name: sc_name, school_id: s_id.id).take
        school_class_teacher_id = SchoolClassTeacher.where(school_class_id: school_class.id, teacher_id: teacher_id)
        if !school_class_teacher_id.present? # per verificare se l'insegnante insegna in quella classe
            render 'posts/new'
        end

        p_link = params[:submit_link]
        p_deadline = params[:deadline].first
        p_desc = params[:description]
        Post.create({:link => p_link, :deadline => p_deadline, :user_id => teacher_id, :description => p_desc, :school_class_id => school_class.id})
        redirect_to '/dashboard'
    end
    
    
end
