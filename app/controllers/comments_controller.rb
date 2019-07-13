class CommentsController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        comment = post.comments.new(comment_params)
        p current_user
        comment.user_id = current_user.id
        if comment.save
            redirect_to post_path(post)
        else    
            p comment.errors
        end
    end
    
    def destroy 
        p params
    end

    private

    def comment_params
        params.require(:comment).permit(:description)
    end
end
