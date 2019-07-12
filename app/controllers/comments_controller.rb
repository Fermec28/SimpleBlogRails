class CommentsController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        comment = post.comments.new(comment_params)
        comment.save
        redirect_to post_path(post)
    end
    
    def destroy 
        p params
    end

    private

    def comment_params
        params.require(:comment).permit(:description)
    end
end
