class PostsController < ApplicationController
    before_action :set_target_post, only:[:show, :edit, :update, :destroy]
    before_action :logged_in_user, only: [:new, :show, :edit, :create, :update, :destroy]
  
    def index
      @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
      @posts = @posts.page(params[:page])
    end
    
    def new
      @post = Post.new(flash[:board])
    end
    
    def create
       post = current_user.posts.build(post_params)
       post.image.attach(params[:post][:image])
        if post.save
          flash[:notice] = "「#{post.address}」の記事が投稿されました!"
          redirect_to post
        else
          redirect_to new_post_path, flash: {
          post: post,
          error_messages: post.errors.full_messages
          }
        end
    end
    
    def show
    end

    def edit
    end
    
    def update
        @post.update(post_params)
        flash[:notice] = "「#{@post.address}」の記事を更新しました!"
        redirect_to @post
    end
    
    def destroy
        @post.destroy
        flash[:notice] = "「#{@post.address}」の記事を削除しました!"
        redirect_to posts_path
    end

    private
    
    def post_params
      params.require(:post).permit(:name, :address, :content, :image, tag_ids: [])
    end
    
    def set_target_post
        @post = Post.find(params[:id])
    end

end