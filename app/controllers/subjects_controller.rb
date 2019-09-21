class SubjectsController < ApplicationController

    def index 
        if !user_signed_in?
            redirect_to user_session_path and return
        end

        u_id = current_user.id
        m_schoolClass_id = Membership.find_by(user_id: u_id).schoolClass_id
        @subjects = SchoolClassTeacher.where(school_class_id: m_schoolClass_id)
        @profs = Array.new 
        @subjects.each do |subject|
            prof = User.find(subject.teacher_id)
            @profs.append(prof)
        end
    end 

    def show 
        if !user_signed_in?
            redirect_to user_session_path and return
        end

        @subject = SchoolClassTeacher.find(params[:id])
        @prof = User.find(@subject.teacher_id)
    end 

end
