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
        @posts = Post.where(user_id: @prof.id, school_class_id: @subject.school_class_id).limit(5)

        # UPDATE
        #metadata = Google::Apis::DriveV2::File.new(title: 'Italiano_appunti')
        #metadata = @drive.insert_file(metadata, upload_source: 'app/assets/files/Italiano1.txt', content_type: 'text/plain')

        #metadata = Google::Apis::DriveV2::File.new(title: 'Italiano_slides')
        #metadata = @drive.insert_file(metadata, upload_source: 'app/assets/files/Italiano1.txt', content_type: 'text/plain')
        
        @files = @drive.list_files(q: "title contains '#{@subject.subject}'")
        
        # DELETE
        #@files.items.each do |file|
         #   @drive.delete_file(file.id)
        #end
    end 

    def view_file

        #file_id = params[:file]
        subject_id = params[:id]
        #puts file_id
        #@files = @drive.list_files(q: "title contains 'Italiano'")
        #puts "STARTED DOWNLOAD"
        #@drive.get_file(file_id, download_dest: 'tmp/test_ita.txt')
        #puts "END DOWNLOAD"
        d_file
        flash[:notice] = "Download effettuato!"
        # redirect_to 'subjects'+subject_id exposes the application to redirect attack
        redirect_to controller: 'subjects', action: 'show', id: subject_id  #redirect in a secure way

    end

end
