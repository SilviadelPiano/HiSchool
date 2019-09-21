class PostsController < ApplicationController

    def def new
        if !user_signed_in?
            redirect_to user_session_path and return
        end

        @post = Post.new

    end

    def create 
        if !user_signed_in?
            redirect_to user_session_path and return
        end

        redirect_to '/dashboard'
    end
    
    
end
