class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = @post.comments.new
    end

    def new
        @post = Post.new
    end

    def create
        post = Post.new(post_params)
        if post.save
            redirect_to post_path(post)    
        else
            flash[:errors] = post.errors.messages
            redirect_to root_path
        end
        
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        post = Post.find(params[:id])
        post.update(post_params)
        redirect_to post_path(post)
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to root_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :description)
    end

end
